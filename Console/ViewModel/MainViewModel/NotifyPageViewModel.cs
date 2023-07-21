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
            
            // 默认选中第一个分页
            CurrentTabIndex = 0;

            // 初始化 RefreshCommand
            RefreshCommand = new AsyncRelayCommand(RefreshAsync);
        }
        private async Task RefreshAsync()
        {
            // 在这里更新分页内容或其他数据
            // 此处省略具体逻辑
            await Task.Delay(2000);

            // 停止下拉刷新
            IsRefreshing = false;
        }
    }
}
