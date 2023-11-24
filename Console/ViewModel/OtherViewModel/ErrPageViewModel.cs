using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.View.Startup;
using System.Net;

namespace Console.ViewModel.OtherViewModel
{
    [QueryProperty("StatusCode", "StatusCode")]
    public partial class ErrPageViewModel : ObservableObject
    {
        [RelayCommand]
        async Task SignOutAsync()
        {
            await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
        }

        [ObservableProperty]
        private HttpStatusCode statusCode;
    }
}
