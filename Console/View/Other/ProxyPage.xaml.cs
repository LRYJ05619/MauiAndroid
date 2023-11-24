using Console.View.Main;
using Console.ViewModel.OtherViewModel;

namespace Console.View.Other;

public partial class ProxyPage : ContentPage
{
    public ProxyPage(ProxyPageViewModel proxyPageViewModel)
    {
        InitializeComponent();
        BindingContext = proxyPageViewModel;
    }
    protected override bool OnBackButtonPressed()
    {
        _ = Shell.Current.GoToAsync($"//{nameof(DevicePage)}");
        return true;
    }
}