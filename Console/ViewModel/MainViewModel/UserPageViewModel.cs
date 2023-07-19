using CommunityToolkit.Mvvm.Input;
using Console.View.Startup;

namespace Console.ViewModel.MainViewModel
{
    public partial class UserPageViewModel
    {
        [RelayCommand]
        async Task SignOutAsync()
        {
            if (Preferences.ContainsKey(nameof(App.UserReserve)))
            {
                Preferences.Remove(nameof(App.UserReserve));
            }
            await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
        }
    }
}
