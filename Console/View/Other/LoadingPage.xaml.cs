using Console.ViewModel.OtherViewModel;

namespace Console.View.Startup;

public partial class LoadingPage : ContentPage
{
	public LoadingPage(LoadingPageViewModel loadingPageViewModel)
	{
		InitializeComponent();
		this.BindingContext = loadingPageViewModel;
	}
}