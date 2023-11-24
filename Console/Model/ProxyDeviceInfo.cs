namespace Console.Model
{
    public class ProxyDevice
    {
        public int total { get; set; }
        public int offset { get; set; }
        public int limit { get; set; }
        public List<DeviceTypeInfo> devices { get; set; }
    }
    public class DeviceTypeInfo
    {
        public string name { get; set; }
        public string @class { get; set; }
        public List<Prop> props { get; set; }
    }
    public class Prop
    {
        public string name { get; set; }
        public string desc { get; set; }
        public string type { get; set; }
        public string unit { get; set; }
    }
}
