using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.Model;
using Console.View.Startup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Console.ViewModel.OtherViewModel
{
    [QueryProperty("StatusCode", "StatusCode")]
    public partial class ErrPageViewModel : ObservableObject
    {
        [RelayCommand]
        async Task SignOutAsync()
        {
            await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
        }

        [ObservableProperty] 
        private HttpStatusCode statusCode;
    }
}
