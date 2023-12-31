﻿using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.Model;
using Console.Serivices.Interface;
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

        public LoginPageViewModel()
        {
            string userDeatilsStr = Preferences.Get(nameof(App.UserReserve), "");

            if (!string.IsNullOrWhiteSpace(userDeatilsStr))
            {
                var reserve = Preferences.Get(nameof(App.UserReserve), string.Empty);
                var userReserve = JsonConvert.DeserializeObject<UserReserve>(reserve);

                UserName = userReserve.email;
                Password = userReserve.password;
                IpAddr = userReserve.ipaddr;
            }
        }

        [RelayCommand]
        async Task LoginAsync()
        {
            if (!string.IsNullOrWhiteSpace(UserName)
                && !string.IsNullOrWhiteSpace(Password)
                && !string.IsNullOrWhiteSpace(IpAddr))
            {
                var UserReserve = await loginReponsitory.Login(UserName, Password, IpAddr);

                if (UserReserve == null)
                    return;

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
