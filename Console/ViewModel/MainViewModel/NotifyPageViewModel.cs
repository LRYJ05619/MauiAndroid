using CommunityToolkit.Mvvm.Input;
using Console.Serivices.Server;
using LiveChartsCore.Defaults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console.ViewModel.MainViewModel
{
    public partial class NotifyPageViewModel : BaseViewModel
    {
        public NotifyPageViewModel
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
    }
}
