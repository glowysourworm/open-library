using System.Threading.Tasks;

using OpenLibrary.Service.Controller.ControllerTask;
using OpenLibrary.Service.ControllerMessage;

namespace OpenLibrary.Service.Controller
{
    internal class RunningTask
    {
        /// <summary>
        /// (Dispatcher) Task object
        /// </summary>
        internal Task Task { get; set; }

        /// <summary>
        /// (Worker) Set of running data
        /// </summary>
        internal BackendTask BackendTask { get; set; }
    }
}
