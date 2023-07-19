using Console.Model;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;
using Device = Console.Model.Device;

namespace Console.Serivices.Server
{
    public class DeviceGetService
    {
        HttpClient client;

        public DeviceGetService()
        {
            client = new HttpClient();
        }

        public async Task<List<Isd2180s>> AlertsDataGet(UserReserve reserve)
        {
            try
            {
                client.DefaultRequestHeaders.Remove("Authorization");
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {reserve.token}");

                var url = "http://" + reserve.ipaddr + "/mappings/device/isd2180?limit=10&offset=0";

                var response = await client.GetAsync(url);

                Device userResponse = new();
                List<Isd2180s> isd2180SList = new();

                if (response.IsSuccessStatusCode)
                {
                    userResponse = await response.Content.ReadFromJsonAsync<Device>();
                }

                isd2180SList = userResponse.isd2180s;

                return isd2180SList;
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
