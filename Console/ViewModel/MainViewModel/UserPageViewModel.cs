using System.Diagnostics;
using CommunityToolkit.Mvvm.Input;
using Console.View.Startup;
using Android.Content;
using Android.Provider;

namespace Console.ViewModel.MainViewModel
{
    public partial class UserPageViewModel
    {
        [RelayCommand]
        async Task SignOutAsync()
        {
            //if (Preferences.ContainsKey(nameof(App.UserReserve)))
            //{
            //    Preferences.Remove(nameof(App.UserReserve));
            //}
            await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
        }

        [RelayCommand]
        void GoToSet()
        {
            try
            {
                var intent = new Intent(Settings.ActionChannelNotificationSettings);
                intent.PutExtra(Settings.ExtraAppPackage, Android.App.Application.Context.PackageName);
                intent.PutExtra(Settings.ExtraChannelId, "Plugin.LocalNotification.GENERAL");
                intent.AddFlags(ActivityFlags.NewTask); // 添加 FLAG_ACTIVITY_NEW_TASK 标志
                Android.App.Application.Context.StartActivity(intent);
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }
        }

    }
}
