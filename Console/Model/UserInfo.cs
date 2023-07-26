using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console.Model
{
    public class UserAuthentication
    {
        public string email { get; set; }
        public string password { get; set; }
    }

    public class UserResponse
    {
        public string token { get; set; }
        public int role_id { get; set; }
        public List<string> area_id { get; set; }
        public string expired { get; set; }
    }

    public class UserReserve
    {
        public string email { get; set; }
        public string password { get; set; }
        public string ipaddr { get; set; }
        public string token { get; set; }
        //token用时间戳
        public long timestamp { get; set; }
        //报警用时间戳
        public long alertTimestamp { get; set; }
    }
}
