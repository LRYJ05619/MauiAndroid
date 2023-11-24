using AndroidX.AppCompat.Widget;

namespace Console.Platforms.Android
{
    public class MyEntryHandler : Microsoft.Maui.Handlers.EntryHandler
    {
        protected override void ConnectHandler(AppCompatEditText platformView)
        {
            platformView.Background = null;
            base.ConnectHandler(platformView);
        }
    }
}
