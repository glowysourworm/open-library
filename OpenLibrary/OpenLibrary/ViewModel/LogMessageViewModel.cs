
using OpenLibrary.Service.ControllerMessage;
using System;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel
{
    public class LogMessageViewModel : ViewModelBase
    {
		string _message;
		DateTime _timestamp;
		string _exceptionMessage;
		string _exceptionDetail;
		string _innerExceptionMessage;
		string _innerExceptionDetail;
		LogMessageType _messageType;
		LogMessageSeverity _severity;

		public string Message
		{
			get { return _message; }
			set { this.RaiseAndSetIfChanged(ref _message, value); }
		}
		public DateTime Timestamp
		{
			get { return _timestamp; }
			set { this.RaiseAndSetIfChanged(ref _timestamp, value); }
		}
		public string ExceptionMessage
		{
			get { return _exceptionMessage; }
			set { this.RaiseAndSetIfChanged(ref _exceptionMessage, value); }
		}
		public string ExceptionDetail
		{
			get { return _exceptionDetail; }
			set { this.RaiseAndSetIfChanged(ref _exceptionDetail, value); }
		}
		public string InnerExceptionMessage
		{
			get { return _innerExceptionMessage; }
			set { this.RaiseAndSetIfChanged(ref _innerExceptionMessage, value); }
		}
		public string InnerExceptionDetail
		{
			get { return _innerExceptionDetail; }
			set { this.RaiseAndSetIfChanged(ref _innerExceptionDetail, value); }
		}
		public LogMessageType MessageType
		{
			get { return _messageType; }
			set { this.RaiseAndSetIfChanged(ref _messageType, value); }
		}
		public LogMessageSeverity Severity
		{
			get { return _severity; }
			set { this.RaiseAndSetIfChanged(ref _severity, value); }
		}

		public LogMessageViewModel() { }
    }
}
