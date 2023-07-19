﻿using Console.Model;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace Console.Serivices.Server
{
    public class AlertsDataGetService
    {
        HttpClient client;

        public AlertsDataGetService()
        {
            client = new HttpClient();
        }

        public async Task<List<AlertsDatum>> AlertsDataGet(UserReserve reserve)
        {
            try
            {
                client.DefaultRequestHeaders.Remove("Authorization");
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {reserve.token}");

                var url = "http://" + reserve.ipaddr + "/alertsdata?limit=10&offset=0";

                var response = await client.GetAsync(url);

                Notify userResponse = new();
                List<AlertsDatum> alertDatum = new();

                if (response.IsSuccessStatusCode)
                {
                    userResponse = await response.Content.ReadFromJsonAsync<Notify>();
                }

                alertDatum = userResponse.alerts_data;

                return alertDatum;
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
