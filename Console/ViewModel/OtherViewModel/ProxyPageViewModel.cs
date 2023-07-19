using Android.App;
using Android.Graphics.Drawables;
using Android.OS;
using Android.Widget;
using CommunityToolkit.Mvvm.Input;
using Console.View.Main;

namespace Console.ViewModel.OtherViewModel
{
    public partial class ProxyPageViewModel
    {
        [RelayCommand]
        async Task GoToDeviceAsync()
        {
            await Shell.Current.GoToAsync($"//{nameof(DevicePage)}");
        }
    }
}
