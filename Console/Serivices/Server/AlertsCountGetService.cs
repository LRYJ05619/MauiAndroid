using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;
using Console.Model;
using Console.Serivices.Interface;

namespace Console.Serivices.Server
{
    public class AlertsCountGetService
    {
        HttpClient client;

        public AlertsCountGetService()
        {
            client = new HttpClient();
        }
        
        public async Task<RequirdAkertsCount> AlertsCountGet(List<Project> projects, UserReserve reserve)
        {
            try
            {
                client.DefaultRequestHeaders.Remove("Authorization");
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {reserve.token}");

                RequirdAkertsCount requirdAkerts = new();

                foreach (Project project in projects)
                {
                    var IDurl = "http://" + reserve.ipaddr + "/alertsdata/count/" + project.id;

                    var AlertsResponse = await client.GetAsync(IDurl);

                    if (AlertsResponse.IsSuccessStatusCode)
                    {
                        var alertResponse = await AlertsResponse.Content.ReadFromJsonAsync<Alertsdata>();

                        requirdAkerts.AllLeave1 = requirdAkerts.AllLeave1 + alertResponse.inactive.level1 + alertResponse.active.level1;
                        requirdAkerts.AllLeave2 = requirdAkerts.AllLeave2 + alertResponse.inactive.level2 + alertResponse.active.level2;
                        requirdAkerts.AllLeave3 = requirdAkerts.AllLeave3 + alertResponse.inactive.level3 + alertResponse.active.level3;

                        requirdAkerts.AllInactive = requirdAkerts.AllInactive + alertResponse.inactive.level1 +
                            alertResponse.inactive.level2 + alertResponse.inactive.level3;

                        requirdAkerts.AllActive = requirdAkerts.AllActive + alertResponse.active.level1 +
                            alertResponse.active.level2 + alertResponse.active.level3;
                    }
                }

                requirdAkerts.Polling = (double)requirdAkerts.AllInactive / (requirdAkerts.AllInactive + requirdAkerts.AllActive) * 100;
                requirdAkerts.Polling = Math.Round(requirdAkerts.Polling, 2);
                return requirdAkerts;
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
