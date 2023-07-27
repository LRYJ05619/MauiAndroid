using Console.Model;
using Console.View;
using Console.View.Main;
using Console.View.Startup;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console.ViewModel.SatrtupViewModel
{
    public partial class LoadingPageViewModel
    {
        public LoadingPageViewModel()
        {
            CheckUserLoginDetails();
        }

        private async void CheckUserLoginDetails()
        {
            string userDeatilsStr = Preferences.Get(nameof(App.UserReserve), "");

            //没有保存的用户信息
            if (string.IsNullOrWhiteSpace(userDeatilsStr))
            {
                await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
            }
            else
            {
                var reserve = Preferences.Get(nameof(App.UserReserve), string.Empty);
                var userReserve = JsonConvert.DeserializeObject<UserReserve>(reserve);

                var currentTimestamp = DateTimeOffset.UtcNow.ToUnixTimeSeconds(); // 当前时间戳

                //token过期
                if (currentTimestamp >= userReserve.timestamp)
                {

                    await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
                }
                else
                {
                    await Shell.Current.GoToAsync($"//{nameof(ConsolePage)}");
                }
            }
        }
    }
}
