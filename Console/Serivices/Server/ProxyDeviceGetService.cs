using Console.Model;
using System.Diagnostics;
using System.Net.Http.Json;

namespace Console.Serivices.Server
{
    public class ProxyDeviceGetService
    {
        HttpClient client;

        public ProxyDeviceGetService()
        {
            client = new HttpClient();
        }

        public async Task<List<DeviceTypeInfo>> ProxyDevcieGet(UserReserve reserve)
        {
            try
            {
                client.DefaultRequestHeaders.Remove("Authorization");
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {reserve.token}");

                var url = "http://" + reserve.ipaddr + "/proxy/device/support";

                var response = await client.GetAsync(url);

                ProxyDevice userResponse = new();
                List<DeviceTypeInfo> deviceType = new();

                if (response.IsSuccessStatusCode)
                {
                    userResponse = await response.Content.ReadFromJsonAsync<ProxyDevice>();
                }

                deviceType = userResponse.devices;

                return deviceType;
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                await Shell.Current.DisplayAlert("Error",
                    $"Unable to Get AlertsCount:{ex.Message}", "OK");
                return null;
            }
        }
    }
}
