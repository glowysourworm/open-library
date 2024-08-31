using System;

using OpenLibrary.Service.ControllerMessage;

namespace OpenLibrary.Service.Controller.ControllerTask
{
    internal class BackendTaskEvent
    {
        internal BackendTaskStatus TaskStatus { get; }
        internal DateTime Time { get; }
        internal LogMessage Log { get; }
        internal bool IsError { get; }

        internal BackendTaskEvent(BackendTaskStatus status, LogMessage message, bool isError)
        {
            this.TaskStatus = status;
            this.Log = message;
            this.Time = DateTime.Now;
            this.IsError = isError;
        }
    }
}
