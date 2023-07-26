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
        [ObservableProperty] [NotifyPropertyChangedFor(nameof(TreatedStatu))]
        private bool _untreatedStatu;
        public bool TreatedStatu => !UntreatedStatu;

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
            UntreatedStatu = true;
            //基础服务
            _ = BasicInfoGetAsync();

            //刷新时间
            StartTimer(60000);
        }

        [RelayCommand]
        void SetUntreatedStatu()
        {
            UntreatedStatu = false;
        }

        [RelayCommand]
        void SetTreatedStatu()
        {
            UntreatedStatu = true;
        }
    }
}
