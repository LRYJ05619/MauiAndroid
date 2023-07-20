﻿using CommunityToolkit.Mvvm.Input;
using Console.Serivices.Server;
using Console.Model;
using Console.View.Other;

namespace Console.ViewModel.MainViewModel
{
    public partial class DevicePageViewModel : BaseViewModel
    {
        public DevicePageViewModel
        (
            AlertsCountGetService alertsCountGetReponsitory,
            AlertsDataGetService alertsDataGetReponsitory,
            DeviceGetService deviceGetService,
            ItemIdGetService itemIDGetReponsitory,
            ProxyDeviceGetService proxyDevcieGetService
        )
            : base
            (
                alertsCountGetReponsitory,
                alertsDataGetReponsitory,
                deviceGetService,
                itemIDGetReponsitory,
                proxyDevcieGetService
            )
        {
            //基础服务
            _ = BasicInfoGetAsync();
            StartTimer(60000);
        }

        [RelayCommand]
        async Task GoToProxyAsync(RequirdISD2180Info requirdIsd2180)
        {
            if (requirdIsd2180 is null)
                return;

            await Shell.Current.GoToAsync($"//{nameof(ProxyPage)}", true,
                new Dictionary<string, object>
                {
                    { "SensorInfo", requirdIsd2180 }
                });
        }
    }
}
