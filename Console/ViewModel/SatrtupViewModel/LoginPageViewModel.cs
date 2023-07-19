using System.Diagnostics;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.Model;
using Console.Serivices;
using Console.Serivices.Interface;
using Console.View;
using Console.View.Main;
using Newtonsoft.Json;

namespace Console.ViewModel.SatrtupViewModel
{
    public partial class LoginPageViewModel : ObservableObject
    {
        [ObservableProperty]
        private string _userName;
        [ObservableProperty]
        private string _password;
        [ObservableProperty]
        private string _ipAddr;

        private readonly ILoginReponsitory loginReponsitory = new LoginService();

        [RelayCommand]
        async Task LoginAsync()
        {
            if (!string.IsNullOrWhiteSpace(UserName)    
                && !string.IsNullOrWhiteSpace(Password) 
                && !string.IsNullOrWhiteSpace(IpAddr))
            {
                var UserReserve = await loginReponsitory.Login(UserName, Password, IpAddr);

                if (UserReserve == null)
                {
                    return;
                }

                if (Preferences.ContainsKey(nameof(App.UserReserve)))
                {
                    Preferences.Remove(nameof(App.UserReserve));
                }

                var userReserve = JsonConvert.SerializeObject(UserReserve);

                Preferences.Set(nameof(App.UserReserve), userReserve);
                App.UserReserve = UserReserve;

                await Shell.Current.GoToAsync($"//{nameof(ConsolePage)}");
            }
        }
    }
}
