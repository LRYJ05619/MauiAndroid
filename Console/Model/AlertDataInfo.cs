using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console.Model
{
    public class RequirdAlertData
    {
        public string untreatedproject { get; set; }
        public string untreatedsensorName { get; set; }
        public string untreateddeviceType { get; set; }
        public string untreatedproperty { get; set; }
        public double untreatedvalue { get; set; }
        public string untreatedleave { get; set; }
        public string untreatedtime { get; set; }

        public string treatedproject { get; set; }
        public string treatedsensorName { get; set; }
        public string treateddeviceType { get; set; }
        public string treatedproperty { get; set; }
        public double treatedvalue { get; set; }
        public string treatedleave { get; set; }
        public string treatedtime { get; set; }
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
