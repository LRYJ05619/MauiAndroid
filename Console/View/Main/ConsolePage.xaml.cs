using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using Console.ViewModel.MainViewModel;
using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.PlatformConfiguration;
using Microsoft.Maui.Controls.PlatformConfiguration.WindowsSpecific;
using static System.Net.Mime.MediaTypeNames;
using Application = Microsoft.Maui.Controls.Application;

namespace Console.View.Main;

public partial class ConsolePage : ContentPage
{
	public ConsolePage(ConsolePageViewModel consolePageViewModel)
	{
        InitializeComponent();
        BindingContext = consolePageViewModel;
    }

    private static bool isBackPressed = false;
    private static System.Timers.Timer backButtonTimer = new System.Timers.Timer();

    protected override bool OnBackButtonPressed()
    {
        if (!isBackPressed)
        {
            isBackPressed = true;
            backButtonTimer.Interval = 2000; // ���ü�ʱ�����Ϊ2��
            backButtonTimer.Elapsed += (s, e) => isBackPressed = false; // ��ʱ��ʱ�䵽ʱ�����ñ�־λ
            backButtonTimer.Start();

            CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

            var toast = Toast.Make("�ٰ�һ���˳�Ӧ��");
            _ = toast.Show(cancellationTokenSource.Token);
            return true;
        }
        else
        {
            return base.OnBackButtonPressed();
        }
    }
}