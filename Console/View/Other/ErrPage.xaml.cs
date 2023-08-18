using Console.ViewModel.OtherViewModel;

namespace Console.View.Other;

public partial class ErrPage : ContentPage
{
	public ErrPage(ErrPageViewModel errPageViewModel)
	{
		InitializeComponent();
        this.BindingContext = errPageViewModel;
    }
}