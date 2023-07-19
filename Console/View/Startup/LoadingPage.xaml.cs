using Console.ViewModel.SatrtupViewModel;

namespace Console.View.Startup;

public partial class LoadingPage : ContentPage
{
	public LoadingPage(LoadingPageViewModel loadingPageViewModel)
	{
		InitializeComponent();
		this.BindingContext = loadingPageViewModel;
	}
}