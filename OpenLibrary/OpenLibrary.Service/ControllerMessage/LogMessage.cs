using System;

namespace OpenLibrary.Service.ControllerMessage
{
    public class LogMessage : BackendMessage
    {
        public int TaskId { get; set; }
        public string Message { get; set; }
        public DateTime Timestamp { get; set; }
        public string ExceptionMessage { get; set; }
        public string ExceptionDetail { get; set; }
        public string InnerExceptionMessage { get; set; }
        public string InnerExceptionDetail { get; set; }
        public LogMessageType MessageType { get; set; }
        public LogMessageSeverity Severity { get; set; }

        public LogMessage(LogMessage copy)
        {
            this.TaskId = copy.TaskId;
            this.MessageType = copy.MessageType;
            this.Message = copy.Message;
            this.Timestamp = copy.Timestamp;
            this.ExceptionMessage = copy.ExceptionMessage;
            this.ExceptionDetail = copy.ExceptionDetail;    
            this.InnerExceptionMessage = copy.InnerExceptionMessage;
            this.InnerExceptionDetail = copy.InnerExceptionDetail;
            this.Severity = copy.Severity;
        }
        public LogMessage(int taskId, string message)
        {
            this.TaskId = taskId;
            this.Message = message;
            this.Timestamp = DateTime.Now;
            this.ExceptionMessage = "";
            this.ExceptionDetail = "";
            this.InnerExceptionMessage = "";
            this.InnerExceptionDetail = "";
            this.MessageType = LogMessageType.System;
            this.Severity = LogMessageSeverity.Info;
        }
        public LogMessage(int taskId, string message, LogMessageType type, LogMessageSeverity severity)
        {
            this.TaskId = taskId;
            this.Message = message;
            this.Timestamp = DateTime.Now;
            this.ExceptionMessage = "";
            this.ExceptionDetail = "";
            this.InnerExceptionMessage = "";
            this.InnerExceptionDetail = "";
            this.MessageType = type;
            this.Severity = severity;
        }
        public LogMessage(int taskId, string message, Exception exception)
        {
            this.TaskId = taskId;
            this.Message = message;
            this.Timestamp = DateTime.Now;
            this.ExceptionMessage = exception?.Message ?? "";
            this.ExceptionDetail = exception?.ToString() ?? "";
            this.InnerExceptionMessage = exception?.InnerException?.Message ?? "";
            this.InnerExceptionDetail = exception?.InnerException?.ToString() ?? "";
            this.MessageType = LogMessageType.System;
            this.Severity = LogMessageSeverity.Error;
        }
        public LogMessage(int taskId, string message, Exception exception, LogMessageType type)
        {
            this.TaskId = taskId;
            this.Message = message;
            this.Timestamp = DateTime.Now;
            this.ExceptionMessage = exception?.Message ?? "";
            this.ExceptionDetail = exception?.ToString() ?? "";
            this.InnerExceptionMessage = exception?.InnerException?.Message ?? "";
            this.InnerExceptionDetail = exception?.InnerException?.ToString() ?? "";
            this.MessageType = type;
            this.Severity = LogMessageSeverity.Error;
        }
    }
}
