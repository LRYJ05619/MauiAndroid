namespace Console.Model
{
    public class DeviceStatuCount
    {
        public int online { get; set; }
        public int offline { get; set; }
        public double polling { get; set; }
        public int alertCount { get; set; }
    }
    public class RequirdISD2180Info
    {
        public string project { get; set; }
        public string id { get; set; }
        public string name { get; set; }
        public string position { get; set; }
        public string createdTime { get; set; }
        public string underDevcie { get; set; }
        public bool status { get; set; }
        public List<RequirdSensorInfo> sensors { get; set; }
    }

    public class RequirdSensorInfo
    {
        public int index { get; set; }
        public string type { get; set; }
        public string name { get; set; }
        public string position { get; set; }
    }
    public class Device
    {
        public int total { get; set; }
        public int offset { get; set; }
        public int limit { get; set; }
        public string order { get; set; }
        public string direction { get; set; }
        public List<Isd2180s> isd2180s { get; set; }
    }

    public class Isd2180s
    {
        public string id { get; set; }
        public string name { get; set; }
        public string device_id { get; set; }
        public string position { get; set; }
        public string project_id { get; set; }
        public bool init { get; set; }
        public List<Sensor> sensors { get; set; }
        public DeviceMetadata metadata { get; set; }
        public bool status { get; set; }
    }

    public class Sensor
    {
        public string id { get; set; }
        public string name { get; set; }
        public string @class { get; set; }
        public string type { get; set; }
        public int index { get; set; }
        public string position { get; set; }
    }

    public class DeviceMetadata
    {
        public string created_time { get; set; }
        public Isd2180 isd2180 { get; set; }
        public string project_id { get; set; }
    }

    public class Isd2180
    {
        public string node_id { get; set; }
        public string position { get; set; }
        public string sensor_id { get; set; }
        public string type { get; set; }
    }
}
