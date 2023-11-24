using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.Model;
using Console.View.Main;

namespace Console.ViewModel.OtherViewModel
{
    [QueryProperty("SensorInfo", "SensorInfo")]
    public partial class ProxyPageViewModel : ObservableObject
    {
        [ObservableProperty]
        private RequirdISD2180Info sensorInfo;

        [RelayCommand]
        async Task GoToDeviceAsync()
        {
            await Shell.Current.GoToAsync($"//{nameof(DevicePage)}");
        }
    }
}
