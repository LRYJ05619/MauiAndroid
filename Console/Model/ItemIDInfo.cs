using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console.Model
{
    //返回响应
    public class ItemID
    {
        public int total { get; set; }
        public int offset { get; set; }
        public int limit { get; set; }
        public string order { get; set; }
        public string direction { get; set; }
        public List<Project> projects { get; set; }
    }

    public class Project
    {
        public string id { get; set; }
        public string name { get; set; }
        public string area_id { get; set; }
        public List<string> contact_id { get; set; }
        public string owner { get; set; }
        public ProjectMetadata metadata { get; set; }
    }

    public class ProjectMetadata
    {
        public string address { get; set; }
        public string created_time { get; set; }
        public string des { get; set; }
        public string initId { get; set; }
        public string initStatus { get; set; }
        public string position { get; set; }
    }

}
