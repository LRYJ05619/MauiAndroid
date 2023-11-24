using Console.ViewModel.SatrtupViewModel;

namespace Console.View.Startup;

public partial class LoginPage : ContentPage
{
    public LoginPage(LoginPageViewModel loginPageViewModel)
    {
        InitializeComponent();
        this.BindingContext = loginPageViewModel;
    }
}