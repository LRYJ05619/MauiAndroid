using Console.Model;

namespace Console;

public partial class App : Application
{
    public static UserReserve UserReserve;
    public App()
    {
        InitializeComponent();

        MainPage = new AppShell();
    }
}
