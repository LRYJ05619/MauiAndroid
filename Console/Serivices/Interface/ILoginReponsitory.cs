using Console.Model;

namespace Console.Serivices.Interface
{
    public interface ILoginReponsitory
    {
        Task<UserReserve> Login(string username, string password, string ipaddr);
    }
}
