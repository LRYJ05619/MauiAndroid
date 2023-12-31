﻿using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.Model;
using Console.Serivices.Server;
using Console.View.Other;
using LiveChartsCore.Defaults;
using Newtonsoft.Json;
using Plugin.LocalNotification;
using Plugin.LocalNotification.AndroidOption;
using System.Diagnostics;
using System.Net;

namespace Console.ViewModel
{
    public partial class BaseViewModel : ObservableObject
    {

        [ObservableProperty]
        private bool isRefreshing;

        //在线状态
        [ObservableProperty]
        private DeviceStatuCount _deviceStatuCount = new DeviceStatuCount();
        //报警数量
        [ObservableProperty]
        private RequirdAkertsCount _requirdAkertsCount = new RequirdAkertsCount();

        //已处理
        [ObservableProperty]
        private List<UntreatedAlertsData> _untreated = new List<UntreatedAlertsData>();
        //未处理
        [ObservableProperty]
        private List<TreatedAlertsData> _treated = new List<TreatedAlertsData>();

        //ISD2180设备
        [ObservableProperty]
        private List<RequirdISD2180Info> _requirdISD2180Info = new List<RequirdISD2180Info>();

        private Timer timer;
        private bool isTimerRunning = false;
        private int NotifyID = 0;

        //设备状态
        public ObservableValue DevicePollingValue { get; set; }
        //报警数量
        public ObservableValue Allleave1Value { get; set; }
        public ObservableValue Allleave2Value { get; set; }
        public ObservableValue Allleave3Value { get; set; }
        public ObservableValue PollingValue { get; set; }

        //服务实例化
        AlertsCountGetService alertsCountGetReponsitory;
        AlertsDataGetService alertsDataGetReponsitory;
        DeviceGetService deviceGetReponsitory;
        ItemIdGetService itemIDGetReponsitory;
        ProxyDeviceGetService proxyDevcieGetReponsitory;
        DeviceStatuCountsGetService deviceStatuCountGetReponsitory;

        public BaseViewModel
        (
            AlertsCountGetService alertsCountGetReponsitory,
            AlertsDataGetService alertsDataGetReponsitory,
            DeviceGetService deviceGetReponsitory,
            ItemIdGetService itemIDGetReponsitory,
            ProxyDeviceGetService proxyDevcieGetReponsitory,
            DeviceStatuCountsGetService deviceStatuCountGetReponsitory
        )
        {
            this.alertsCountGetReponsitory = alertsCountGetReponsitory;
            this.alertsDataGetReponsitory = alertsDataGetReponsitory;
            this.deviceGetReponsitory = deviceGetReponsitory;
            this.itemIDGetReponsitory = itemIDGetReponsitory;
            this.proxyDevcieGetReponsitory = proxyDevcieGetReponsitory;
            this.deviceStatuCountGetReponsitory = deviceStatuCountGetReponsitory;

            //实例化实现数据绑定
            DevicePollingValue = new ObservableValue { Value = 0 };
            Allleave1Value = new ObservableValue { Value = 0 };
            Allleave2Value = new ObservableValue { Value = 0 };
            Allleave3Value = new ObservableValue { Value = 0 };
            PollingValue = new ObservableValue { Value = 0 };

            // 初始化计时器，设置回调方法为 TimerCallback，不启动计时器
            timer = new Timer(TimerCallback, null, Timeout.Infinite, Timeout.Infinite);
        }

        // 计时器回调方法
        private async void TimerCallback(object state)
        {
            // 通过 isTimerRunning 标志位避免重复触发
            if (!isTimerRunning)
            {
                isTimerRunning = true;
                await BasicInfoGetAsync();
                isTimerRunning = false;
            }
        }

        //开始计时器
        public void StartTimer(int intervalMilliseconds)
        {
            timer.Change(0, intervalMilliseconds);
        }

        // 停止计时器
        public void StopTimer()
        {
            timer.Change(Timeout.Infinite, Timeout.Infinite);
        }

        [RelayCommand]
        public async Task BasicInfoGetAsync()
        {
            try
            {
                if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                {
                    await Shell.Current.DisplayAlert("网络问题", $"检查你的网络并重试", "3OK");
                }

                //解析储存的用户信息
                var reserve = Preferences.Get(nameof(App.UserReserve), string.Empty);
                var userReserve = JsonConvert.DeserializeObject<UserReserve>(reserve);

                //项目ID获取
                var projectsList = await itemIDGetReponsitory.ItemIDGet(userReserve);

                if (itemIDGetReponsitory.StatusCode != HttpStatusCode.OK)
                {
                    await Shell.Current.GoToAsync($"//{nameof(ErrPage)}", true,
                        new Dictionary<string, object>
                        {
                            { "StatusCode", itemIDGetReponsitory.StatusCode }
                        });
                }
                //设备状态获取
                DeviceStatuCount = await deviceStatuCountGetReponsitory.StatuCountGet(projectsList, userReserve);

                DevicePollingValue.Value = DeviceStatuCount.polling;

                //报警数量获取
                RequirdAkertsCount = await alertsCountGetReponsitory.AlertsCountGet(projectsList, userReserve);

                Allleave1Value.Value = RequirdAkertsCount.AllLeave1;
                Allleave2Value.Value = RequirdAkertsCount.AllLeave2;
                Allleave3Value.Value = RequirdAkertsCount.AllLeave3;
                PollingValue.Value = RequirdAkertsCount.Polling;

                //设备类型获取 
                var deviceTypeList = await proxyDevcieGetReponsitory.ProxyDevcieGet(userReserve);
                //设备信息获取
                var isd2180sList = await deviceGetReponsitory.DeviceDataGet(userReserve);
                //报警信息获取
                var alertsDatumList = await alertsDataGetReponsitory.AlertsDataGet(userReserve);

                //为报警信息分组
                var groupedAlerts = alertsDatumList.GroupBy(alertsDatum => alertsDatum.metadata == null);

                //报警设备数量
                DeviceStatuCount.alertCount = alertsDatumList.GroupBy(data => data.sensor_id).Count();

                Untreated = groupedAlerts.FirstOrDefault(g => g.Key == true)?
                    .Select(alertsDatum => new UntreatedAlertsData()
                    {
                        project = projectsList.FirstOrDefault(project => project.id == alertsDatum.project_id)
                            ?.name,
                        sensorName = isd2180sList
                            .Where(isd => isd.sensors != null)
                            .SelectMany(isd =>
                                isd.sensors.Where(sensor => sensor.id == alertsDatum.sensor_id)
                                    .Select(sensor => sensor.name))
                            .FirstOrDefault(),
                        deviceType = deviceTypeList
                            .FirstOrDefault(deviceType => deviceType.@class == alertsDatum.sensor_type)?.name,
                        property = alertsDatum.property,
                        value = alertsDatum.value,
                        leave = JugeLeave(alertsDatum.level),
                        time = DateTimeOffset.FromUnixTimeSeconds(alertsDatum.time).DateTime.ToString("yyyy-MM-dd HH:mm"),
                        timestamp = alertsDatum.time,
                    }).ToList();

                Treated = groupedAlerts.FirstOrDefault(g => g.Key == false)?
                    .Select(alertsDatum => new TreatedAlertsData()
                    {
                        project =
                            projectsList.FirstOrDefault(project => project.id == alertsDatum.project_id)?.name,
                        sensorName = isd2180sList
                            .Where(isd => isd.sensors != null) // 添加Where条件，过滤掉sensors为null的元素
                            .SelectMany(isd =>
                                isd.sensors.Where(sensor => sensor.id == alertsDatum.sensor_id)
                                    .Select(sensor => sensor.name))
                            .FirstOrDefault(),
                        deviceType = deviceTypeList
                            .FirstOrDefault(deviceType => deviceType.@class == alertsDatum.sensor_type)?.name,
                        property = alertsDatum.property,
                        value = alertsDatum.value,
                        leave = JugeLeave(alertsDatum.level),
                        time = DateTimeOffset.FromUnixTimeSeconds(alertsDatum.time).DateTime.ToString("yyyy-MM-dd HH:mm"),
                        handler = alertsDatum.metadata.handler,
                        info = alertsDatum.metadata.info,
                    }).ToList();

                RequirdISD2180Info = isd2180sList.Select(isd2180s => new RequirdISD2180Info
                {
                    project = projectsList.FirstOrDefault(project => project.id == isd2180s.project_id)?.name,
                    id = isd2180s.device_id,
                    name = isd2180s.name,
                    position = isd2180s.position,
                    createdTime = isd2180s.metadata.created_time,
                    status = isd2180s.status,
                    sensors = isd2180s.sensors?.Select(sensor =>
                        new RequirdSensorInfo
                        {
                            index = sensor.index,
                            name = sensor.name,
                            type = deviceTypeList
                                .FirstOrDefault(deviceType => deviceType.@class == sensor.@class)
                                ?.name,
                            position = sensor.position,
                        }).ToList()
                }).ToList();

                if (Untreated != null)
                {
                    var newMaxTimestamp = Untreated.Max(alertsDatum => alertsDatum.timestamp);


                    //当时间戳大于已储存的时间戳，报警
                    if (newMaxTimestamp > userReserve.alertTimestamp)
                    {
                        foreach (var alertsDatum in Untreated.Where(alertsDatum =>
                                     alertsDatum.timestamp > userReserve.alertTimestamp))
                        {
                            await TriggerAlarm(alertsDatum);
                        }

                        // 更新已保存的最大时间戳
                        userReserve.alertTimestamp = newMaxTimestamp;
                    }
                }

                var userreserve = JsonConvert.SerializeObject(userReserve);
                Preferences.Set(nameof(App.UserReserve), userreserve);
                App.UserReserve = userReserve;

            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                await Shell.Current.DisplayAlert("Error",
                    $"Unable to Login:{ex.Message}", "OK");
            }
            finally
            {
                IsRefreshing = false;
            }
        }

        public string JugeLeave(string leave)
        {
            if ("level1" == leave)
            {
                return "轻度预警";
            }
            else if ("level2" == leave)
            {
                return "中度预警";
            }
            else
            {
                return "重度预警";
            }
        }

        //触发报警
        private async Task TriggerAlarm(UntreatedAlertsData alertsDatum)
        {
            try
            {
                var request = new NotificationRequest
                {
                    Title = $"{alertsDatum.project} · {alertsDatum.leave}",
                    Description = $"{alertsDatum.sensorName}    {alertsDatum.time}",
                    BadgeNumber = 1, //小红点
                    NotificationId = NotifyID,

                    Android = new AndroidOptions
                    {
                        VisibilityType = AndroidVisibilityType.Public, //or Private
                        Priority = AndroidPriority.Max
                    }
                };
                NotifyID++;
                await LocalNotificationCenter.Current.Show(request);
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                await Shell.Current.DisplayAlert("Error",
                    $"Unable to Notify:{ex.Message}", "ok");
            }
        }
    }
}
