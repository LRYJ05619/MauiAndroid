﻿using Console.Model;
using Console.Serivices.Interface;
using System.Diagnostics;
using System.Net.Http.Json;
using static Android.Content.ClipData;

namespace Console.Serivices.Server
{
    public class ItemIdGetService
    {
        HttpClient client;

        public ItemIdGetService()
        {
            client = new HttpClient();
        }

        public async Task<List<Project>> ItemIDGet(UserReserve reserve)
        {
            try
            {
                client.DefaultRequestHeaders.Remove("Authorization");
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {reserve.token}");

                var url = "http://" + reserve.ipaddr + "/projects?limit=40&offset=0";

                var response = await client.GetAsync(url);

                ItemID userResponse = new();
                List<Project> projectList = new();

                if (response.IsSuccessStatusCode)
                {
                    userResponse = await response.Content.ReadFromJsonAsync<ItemID>();
                }

                projectList = userResponse.projects;

                return projectList;
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                await Shell.Current.DisplayAlert("Error",
                    $"Unable to Get ItemID:{ex.Message}", "OK");
                return null;
            }
        }
    }
}
