
using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Command;
using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.ViewModel.ControlViewModel
{
    public class TabItemViewModel : ViewModelBase
    {
        string _displayName;
        bool _isSelected;
        bool _isCloseable;
        SimpleCommand _closeCommand;
        object _data;

        public event SimpleEventHandler<TabItemViewModel> CloseEvent;

        public bool IsSelected
        {
            get { return _isSelected; }
            set { this.RaiseAndSetIfChanged(ref _isSelected, value); }
        }
        public bool IsCloseable
        {
            get { return _isCloseable; }
            set { this.RaiseAndSetIfChanged(ref _isCloseable, value); }
        }
        public string DisplayName
        {
            get { return _displayName; }
            set { this.RaiseAndSetIfChanged(ref _displayName, value); }
        }
        public SimpleCommand CloseCommand
        {
            get { return _closeCommand; }
            set { this.RaiseAndSetIfChanged(ref _closeCommand, value); }
        }
        public object Data
        {
            get { return _data; }
            set { this.RaiseAndSetIfChanged(ref _data, value); }
        }

        public TabItemViewModel()
        {
            _displayName = "Header";
            _isCloseable = false;
            _isSelected = false;

            this.CloseCommand = new SimpleCommand(() =>
            {
                if (this.CloseEvent != null)
                    this.CloseEvent(this);
            });
        }
    }
}
