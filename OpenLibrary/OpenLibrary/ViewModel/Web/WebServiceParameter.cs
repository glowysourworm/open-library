
using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Command;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceParameter : ViewModelBase
    {
        string _name;
        string _value;
        string _defaultValue;
        bool _useParameter;
        SimpleCommand _resetCommand;

        public string Name
        {
            get { return _name; }
            set { this.RaiseAndSetIfChanged(ref _name, value); }
        }
        public string Value
        {
            get { return _value; }
            set { this.RaiseAndSetIfChanged(ref _value, value); }
        }
        public string DefaultValue
        {
            get { return _defaultValue; }
            set { this.RaiseAndSetIfChanged(ref _defaultValue, value); }
        }
        public bool UseParameter
        {
            get { return _useParameter; }
            set { this.RaiseAndSetIfChanged(ref _useParameter, value); }
        }
        public SimpleCommand ResetCommand
        {
            get { return _resetCommand; }
            set { this.RaiseAndSetIfChanged(ref _resetCommand, value); }
        }

        public WebServiceParameter() { }
        public WebServiceParameter(string name, string value, bool useParameter)
        {
            _name = name;
            _value = value;
            _defaultValue = value;
            _useParameter = useParameter;

            this.ResetCommand = new SimpleCommand(() =>
            {
                this.Value = this.DefaultValue;
            });
        }

        public override string ToString()
        {
            return (this.Name ?? "q") + "=" + (this.Value ?? "");
        }
    }
}
