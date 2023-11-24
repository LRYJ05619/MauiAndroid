namespace Console.Model
{
    //所需参数
    public class RequirdAkertsCount
    {
        public int AllLeave1 { get; set; }
        public int AllLeave2 { get; set; }
        public int AllLeave3 { get; set; }
        public int AllInactive { get; set; }
        public int AllActive { get; set; }
        public double Polling { get; set; }
        public int All { get; set; }
    }

    //返回响应
    public class Alertsdata
    {
        public string pid { get; set; }
        public Active active { get; set; }
        public Inactive inactive { get; set; }
    }
    public class Inactive
    {
        public int level1 { get; set; }
        public int level2 { get; set; }
        public int level3 { get; set; }
    }
    public class Active
    {
        public int level1 { get; set; }
        public int level2 { get; set; }
        public int level3 { get; set; }
    }
}
