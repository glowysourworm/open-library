using System;

namespace OpenLibrary.Service.ControllerMessage
{
    public class BackendTaskEventMessage
    {
        public BackendTaskStatus TaskStatus { get; }
        public DateTime Time { get; }
        public LogMessage Log { get; }
        public bool IsError { get; }

        public BackendTaskEventMessage(BackendTaskStatus status, DateTime time, LogMessage log, bool isError)
        {
            this.TaskStatus = status;
            this.Time = time;
            this.Log = log;
            this.IsError = isError;
        }
    }
}
