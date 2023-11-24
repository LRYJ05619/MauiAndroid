using Console.Model;
using System.Diagnostics;
using System.Net.Http.Json;

namespace Console.Serivices.Server
{
    public class DeviceStatuCountsGetService
    {
        HttpClient client;

        public DeviceStatuCountsGetService()
        {
            client = new HttpClient();
        }

        public async Task<DeviceStatuCount> StatuCountGet(List<Project> projects, UserReserve reserve)
        {
            try
            {
                client.DefaultRequestHeaders.Remove("Authorization");
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {reserve.token}");

                DeviceStatuCount requirdStatusCount = new();

                foreach (Project project in projects)
                {
                    var IDurl = "http://" + reserve.ipaddr + "/mappings/device/statusCount/" + project.id;

                    var StatusResponse = await client.GetAsync(IDurl);

                    if (StatusResponse.IsSuccessStatusCode)
                    {
                        var alertResponse = await StatusResponse.Content.ReadFromJsonAsync<DeviceStatuCount>();

                        requirdStatusCount.online = alertResponse.online + requirdStatusCount.online;
                        requirdStatusCount.offline = alertResponse.offline + requirdStatusCount.offline;
                    }
                }
                requirdStatusCount.polling = (double)requirdStatusCount.online / (requirdStatusCount.offline + requirdStatusCount.online) * 100;
                requirdStatusCount.polling = Math.Round(requirdStatusCount.polling, 2);
                return requirdStatusCount;
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                await Shell.Current.DisplayAlert("Error",
                    $"Unable to Get StatusCount:{ex.Message}", "OK");
                return null;
            }
        }
    }
}
