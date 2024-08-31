using System;

using OpenLibrary.Service.ControllerMessage;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceEndpointTaskEventViewModel : ViewModelBase
    {
        int _id;
        int _endpointTaskId;
        BackendTaskStatus _taskStatus;
        DateTime _time;
        bool _isError;
        LogMessageViewModel _log;

        public int Id
        {
            get { return _id; }
            set { this.RaiseAndSetIfChanged(ref _id, value); }
        }
        public int EndpointTaskId
        {
            get { return _endpointTaskId; }
            set { this.RaiseAndSetIfChanged(ref _endpointTaskId, value); }
        }
        public BackendTaskStatus TaskStatus
        {
            get { return _taskStatus; }
            set { this.RaiseAndSetIfChanged(ref _taskStatus, value); }
        }
        public DateTime Time
        {
            get { return _time; }
            set { this.RaiseAndSetIfChanged(ref _time, value); }
        }
        public bool IsError
        {
            get { return _isError; }
            set { this.RaiseAndSetIfChanged(ref _isError, value); }
        }
        public LogMessageViewModel Log
        {
            get { return _log; }
            set { this.RaiseAndSetIfChanged(ref _log, value); }
        }

        public WebServiceEndpointTaskEventViewModel()
        {
            this.Log = new LogMessageViewModel();
        }
    }
}
