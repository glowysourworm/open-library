using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenLibrary.Controller.LibraryOfCongress.Event
{
    public class WebBotEventData
    {
        public string Name { get; set; }
        public int QueueCount { get; set; }
        public ControllerStatus Status { get; set; }
    }
}
