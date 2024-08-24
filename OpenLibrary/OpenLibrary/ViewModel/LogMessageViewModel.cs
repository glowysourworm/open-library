
using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel
{
    public class LogMessageViewModel : ViewModelBase
    {
        string _message;
        bool _isError;

        public string Message
        {
            get { return _message; }
            set { this.RaiseAndSetIfChanged(ref _message, value); }
        }
        public bool IsError
        {
            get { return _isError; }
            set { this.RaiseAndSetIfChanged(ref _isError, value); }
        }

        public LogMessageViewModel() { }
    }
}
