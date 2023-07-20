using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.Model;
using Console.Serivices.Server;
using Java.Util.Logging;
using LiveChartsCore;
using LiveChartsCore.Defaults;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;

namespace Console.ViewModel
{
    public partial class BaseViewModel : ObservableObject
    {

        [ObservableProperty]
        private bool isRefreshing;

        [ObservableProperty]
        private bool isbusy;

        //报警数量
        [ObservableProperty]
        private RequirdAkertsCount _requirdAkertsCount = new RequirdAkertsCount();
        //报警信息未处理
        [ObservableProperty]
        private List<UntreatedAlertData>  _untreatedAlertDatas = new List<UntreatedAlertData>();
        //报警信息已处理
        [ObservableProperty]
        private List<TreatedAlertData> _treatedAlertDatas = new List<TreatedAlertData>();
        //ISD2180设备
        [ObservableProperty]
        private List<RequirdISD2180Info> _requirdISD2180Info = new List<RequirdISD2180Info>();

        private Timer timer;
        private bool isTimerRunning = false;

        //报警数量
        public ObservableValue Allleave1Value { get; set; }
        public ObservableValue Allleave2Value { get; set; }
        public ObservableValue Allleave3Value { get; set; }
        public ObservableValue PollingValue { get; set; }

        //服务实例化
        AlertsCountGetService alertsCountGetReponsitory;
        AlertsDataGetService alertsDataGetReponsitory;
        DeviceGetService deviceGetService;
        ItemIdGetService itemIDGetReponsitory;
        ProxyDeviceGetService proxyDevcieGetReponsitory;

        public BaseViewModel
        (
            AlertsCountGetService alertsCountGetReponsitory,
            AlertsDataGetService alertsDataGetReponsitory,
            DeviceGetService deviceGetService,
            ItemIdGetService itemIDGetReponsitory,
            ProxyDeviceGetService proxyDevcieGetReponsitory
        )
        {
            this.alertsCountGetReponsitory = alertsCountGetReponsitory;
            this.alertsDataGetReponsitory = alertsDataGetReponsitory;
            this.deviceGetService = deviceGetService;
            this.itemIDGetReponsitory = itemIDGetReponsitory;
            this.proxyDevcieGetReponsitory = proxyDevcieGetReponsitory;

            //实例化实现数据绑定
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
                //报警数量获取
                RequirdAkertsCount = await alertsCountGetReponsitory.AlertsCountGet(projectsList, userReserve);
                Allleave1Value.Value = RequirdAkertsCount.AllLeave1;
                Allleave2Value.Value = RequirdAkertsCount.AllLeave2;
                Allleave3Value.Value = RequirdAkertsCount.AllLeave3;
                PollingValue.Value = RequirdAkertsCount.Polling;

                //设备类型获取 
                var deviceTypeList = await proxyDevcieGetReponsitory.ProxyDevcieGet(userReserve);
                //设备信息获取
                var isd2180sList = await deviceGetService.AlertsDataGet(userReserve);
                //报警信息获取
                var alertsDatumList = await alertsDataGetReponsitory.AlertsDataGet(userReserve);

                if (alertsDatumList.Any(alertsDatum => alertsDatum.metadata == null))
                {
                    UntreatedAlertDatas = alertsDatumList.Select(alertsDatum => new UntreatedAlertData
                    {
                        project = projectsList.FirstOrDefault(project => project.id == alertsDatum.project_id)?.name,
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
                        time = DateTimeOffset.FromUnixTimeSeconds(alertsDatum.time).ToString(),
                    }).ToList();
                }
                else
                {
                    TreatedAlertDatas = alertsDatumList.Select(alertsDatum => new TreatedAlertData
                    {
                        // Write properties based on your requirements
                        // Example:
                        project = projectsList.FirstOrDefault(project => project.id == alertsDatum.project_id)?.name,
                        sensorName = isd2180sList
                            .Where(isd => isd.sensors != null)
                            .SelectMany(isd => isd.sensors.Where(sensor => sensor.id == alertsDatum.sensor_id).Select(sensor => sensor.name))
                            .FirstOrDefault(),
                        deviceType = deviceTypeList.FirstOrDefault(deviceType => deviceType.@class == alertsDatum.sensor_type)?.name,
                        property = alertsDatum.property,
                        value = alertsDatum.value,
                        leave = JugeLeave(alertsDatum.level),
                        time = DateTimeOffset.FromUnixTimeSeconds(alertsDatum.time).ToString(),
                        // Include AlertsDatumMetadata here
                        metadata = alertsDatum.metadata,
                    }).ToList();
                }

                RequirdISD2180Info = isd2180sList.Select(isd2180s => new RequirdISD2180Info
                {
                    project = projectsList.FirstOrDefault(project => project.id == isd2180s.project_id)?.name,
                    id = isd2180s.device_id,
                    name = isd2180s.name,
                    position = isd2180s.position,
                    createdTime = isd2180s.metadata.created_time,
                    sensors = isd2180s.sensors?.Select(sensor =>
                        new RequirdSensorInfo
                        {
                            index = sensor.index,
                            name = sensor.name,
                            type = deviceTypeList.FirstOrDefault(deviceType => deviceType.@class == sensor.@class)?.name,
                            position = sensor.position,
                        }).ToList()
                }).ToList();
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
            if ("leave1" == leave)
            {
                return "轻度预警";
            }else if ("leave2" == leave)
            {
                return "中度预警";
            }
            else
            {
                return "重度预警";
            }
        }

        public static List<RequirdISD2180Info> GetRequirdISD2180InfoList(List<Isd2180s> isd2180sList, List<Project> projectsList)
        {
            return isd2180sList.Select(isd2180s => new RequirdISD2180Info
            {
                id = isd2180s.id,
                name = isd2180s.name,
                position = isd2180s.position,
                project = projectsList.FirstOrDefault(project => project.id == isd2180s.project_id)?.name
            }).ToList();
        }

        public static DateTime GetUnixDateTimeMilliseconds(long timestamp)
        {
            long begtime = timestamp * 10000;
            DateTime dt_1970 = new DateTime(1970, 1, 1, 0, 0, 0);
            long tricks_1970 = dt_1970.Ticks;//1970年1月1日刻度
            long time_tricks = tricks_1970 + begtime;//日志日期刻度
            DateTime dt = new DateTime(time_tricks);//转化为DateTime
            return dt;
        }
    }
}
