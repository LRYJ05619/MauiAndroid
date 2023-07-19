using CommunityToolkit.Maui.Alerts;
using Console.ViewModel.MainViewModel;

namespace Console.View.Main;

public partial class DevicePage : ContentPage
{
	public DevicePage(DevicePageViewModel devicePageViewModel)
	{
		InitializeComponent();
		BindingContext = devicePageViewModel;
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