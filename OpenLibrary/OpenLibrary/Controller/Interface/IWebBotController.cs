
using OpenLibrary.Controller.LibraryOfCongress.Event;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Controller.Interface
{
    public interface IWebBotController<T>
    {
        string Name { get; }
        ControllerStatus Status { get; }
        event SimpleEventHandler<string, bool> WebMessageEvent;
        event SimpleEventHandler<WebBotEventData> WebUpdateEvent;
        void Start();
        void Stop(bool haltThreadExecution);
    }
}
