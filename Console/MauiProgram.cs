using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using Console.View;
using Console.ViewModel;
using Console.View.Startup;
using Console.ViewModel.SatrtupViewModel;
using SkiaSharp.Views.Maui.Controls.Hosting;
using Console.Serivices.Server;
using Console.View.Main;
using Console.View.Other;
using Console.ViewModel.MainViewModel;
using Console.ViewModel.OtherViewModel;
using Plugin.LocalNotification.AndroidOption;
using Plugin.LocalNotification;
using Microsoft.Maui.LifecycleEvents;

namespace Console;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()

            .UseMauiCommunityToolkit()
            .UseSkiaSharp(true)

            .ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
			})
            //隐藏标题栏
            .ConfigureMauiHandlers(handlers =>
            {
#if ANDROID
                handlers.AddHandler(typeof(Entry), typeof(Console.Platforms.Android.MyEntryHandler));
#endif
            })
            .ConfigureLifecycleEvents(events =>
            {
                events.AddAndroid(android => android
                    .OnCreate((activity, bundle) => ResidentNotification())
                    .OnStop((activity) => ResidentNotification()));

                static void ResidentNotification()
                {
                    var resident = new NotificationRequest
                    {
                        NotificationId = 1000,
                        Title = "结构健康监测平台",
                        Subtitle = "后台保持通知",
                        Silent = true,

                        Android = new AndroidOptions
                        {
                            VisibilityType = AndroidVisibilityType.Private,//or Public
                            Ongoing = true,
                            AutoCancel = false
                        }
                    };
                    LocalNotificationCenter.Current.Show(resident);
                }
            });

        //Views
        builder.Services.AddSingleton<ConsolePage>();
        builder.Services.AddSingleton<LoginPage>();
        builder.Services.AddSingleton<NotifyPage>();
        builder.Services.AddSingleton<DevicePage>();
        builder.Services.AddSingleton<LoadingPage>();
        builder.Services.AddSingleton<UserPage>();
        builder.Services.AddSingleton<ProxyPage>();
        builder.Services.AddSingleton<ErrPage>();

        //View Models
        builder.Services.AddSingleton<LoginPageViewModel>();
        builder.Services.AddSingleton<LoadingPageViewModel>();
        builder.Services.AddSingleton<UserPageViewModel>();
        builder.Services.AddSingleton<ConsolePageViewModel>();
        builder.Services.AddSingleton<NotifyPageViewModel>();
        builder.Services.AddSingleton<DevicePageViewModel>();
        builder.Services.AddSingleton<ProxyPageViewModel>();
        builder.Services.AddSingleton<ErrPageViewModel>();

        //Serivice
        builder.Services.AddTransient<AlertsCountGetService>();
        builder.Services.AddTransient<AlertsDataGetService>();
        builder.Services.AddTransient<DeviceGetService>();
        builder.Services.AddTransient<ItemIdGetService>();
        builder.Services.AddTransient<ProxyDeviceGetService>();
        builder.Services.AddTransient<DeviceStatuCountsGetService>();


#if DEBUG
        builder.Logging.AddDebug();
#endif

		return builder.Build();
	}
}
