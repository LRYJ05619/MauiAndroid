using CommunityToolkit.Maui.Alerts;
using Console.ViewModel.MainViewModel;
using Microsoft.Maui.Controls;

namespace Console.View.Main;

public partial class NotifyPage : ContentPage
{
	public NotifyPage(NotifyPageViewModel notifyPageViewModel)
	{
		InitializeComponent();
		BindingContext = notifyPageViewModel;
    }

    private static bool isBackPressed = false;
    private static System.Timers.Timer backButtonTimer = new System.Timers.Timer();

    protected override bool OnBackButtonPressed()
    {
        if (!isBackPressed)
        {
            isBackPressed = true;
            backButtonTimer.Interval = 2000; // 设置计时器间隔为2秒
            backButtonTimer.Elapsed += (s, e) => isBackPressed = false; // 计时器时间到时，重置标志位
            backButtonTimer.Start();

            CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

            var toast = Toast.Make("再按一次退出应用");
            _ = toast.Show(cancellationTokenSource.Token);
            return true;
        }
        else
        {
            return base.OnBackButtonPressed();
        }
    }
}