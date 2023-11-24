using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.Serivices.Server;

namespace Console.ViewModel.MainViewModel
{
    public partial class NotifyPageViewModel : BaseViewModel
    {
        [ObservableProperty]
        [NotifyPropertyChangedFor(nameof(TreatedStatu))]
        private bool _untreatedStatu;
        public bool TreatedStatu => !UntreatedStatu;

        public NotifyPageViewModel
        (
            AlertsCountGetService alertsCountGetReponsitory,
            AlertsDataGetService alertsDataGetReponsitory,
            DeviceGetService deviceGetService,
            ItemIdGetService itemIDGetReponsitory,
            ProxyDeviceGetService proxyDevcieGetService,
            DeviceStatuCountsGetService deviceStatuCountGetReponsitory
        )
            : base
            (
                alertsCountGetReponsitory,
                alertsDataGetReponsitory,
                deviceGetService,
                itemIDGetReponsitory,
                proxyDevcieGetService,
                deviceStatuCountGetReponsitory
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
            UntreatedStatu = true;
        }

        [RelayCommand]
        void SetTreatedStatu()
        {
            UntreatedStatu = false;
        }
    }
}
