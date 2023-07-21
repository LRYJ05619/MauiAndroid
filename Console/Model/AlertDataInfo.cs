using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console.Model
{
    public class RequirdAlertData
    {
        public List<UntreatedAlertData> untreat { get; set; }
        public List<TreatedAlertData> treat { get; set; }
    }
    public class UntreatedAlertData
    {
        public string project { get; set; }
        public string sensorName { get; set; }
        public string deviceType { get; set; }
        public string property { get; set; }
        public double value { get; set; }
        public string leave { get; set; }
        public string time { get; set; }
    }

    public class TreatedAlertData
    {
        public string project { get; set; }
        public string sensorName { get; set; }
        public string deviceType { get; set; }
        public string property { get; set; }
        public double value { get; set; }
        public string leave { get; set; }
        public string time { get; set; }
        public AlertsDatumMetadata metadata { get; set; }
    }

    public class Notify
    {
        public int total { get; set; }
        public int offset { get; set; }
        public int limit { get; set; }
        public string order { get; set; }
        public string direction { get; set; }
        public List<AlertsDatum> alerts_data { get; set; }
    }
    public class AlertsDatum
    {
        public string id { get; set; }
        public string name { get; set; }
        public string sensor_id { get; set; }
        public string sensor_type { get; set; }
        public string property { get; set; }
        public string project_id { get; set; }
        public double value { get; set; }
        public long time { get; set; }
        public string level { get; set; }
        public bool state { get; set; }
        public AlertsDatumMetadata metadata { get; set; }
    }
    public class AlertsDatumMetadata
    {   
        public string handler { get; set; }
        public string info { get; set; }
    }
}
