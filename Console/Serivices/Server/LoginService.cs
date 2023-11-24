using Console.Model;
using System.Diagnostics;
using System.Net.Http.Json;

namespace Console.Serivices.Interface
{
    public class LoginService : ILoginReponsitory
    {
        HttpClient httpClient;

        public LoginService()
        {
            httpClient = new HttpClient();
        }

        public async Task<UserReserve> Login(string username, string password, string ipaddr)
        {
            try
            {
                UserAuthentication userAuthentication = new UserAuthentication
                {
                    email = username,
                    password = password
                };

                var url = "http://" + ipaddr + "/tokens";

                var response = await httpClient.PostAsJsonAsync(url, userAuthentication);

                UserResponse userResponse = new();

                if (response.IsSuccessStatusCode)
                {
                    userResponse = await response.Content.ReadFromJsonAsync<UserResponse>();
                }

                UserReserve userReserve = new UserReserve
                {
                    email = username,
                    password = password,
                    ipaddr = ipaddr,
                    token = userResponse.token,
                    timestamp = long.Parse(userResponse.expired)
                };
                return userReserve;

            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                await Shell.Current.DisplayAlert("Error",
                    $"Unable to Login:{ex.Message}", "OK");
                return null;
            }
        }
    }
}
