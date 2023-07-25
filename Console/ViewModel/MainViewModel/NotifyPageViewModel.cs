using CommunityToolkit.Mvvm.Input;
using Console.Serivices.Server;
using LiveChartsCore.Defaults;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;

namespace Console.ViewModel.MainViewModel
{
    public partial class NotifyPageViewModel : BaseViewModel
    {
        [ObservableProperty]
        private ObservableCollection<ContentPage> _tabPages;
        [ObservableProperty]
        private int _currentTabIndex;
        public IAsyncRelayCommand RefreshCommand { get; }

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

            //刷新时间
            StartTimer(60000);
        }
    }
}
