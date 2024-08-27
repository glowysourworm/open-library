
using System.Collections.ObjectModel;

using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Command;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceParameterViewModel : ViewModelBase
    {
        string _name;
        string _value;
        string _defaultValue;
        string _description;
        bool _useParameter;
        bool _commaDelimited;
        bool _arrayParameter;
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
        public string Description
        {
            get { return _description; }
            set { this.RaiseAndSetIfChanged(ref _description, value); }
        }
        public bool UseParameter
        {
            get { return _useParameter; }
            set { this.RaiseAndSetIfChanged(ref _useParameter, value); }
        }
        public bool CommaDelimited
        {
            get { return _commaDelimited; }
            set { this.RaiseAndSetIfChanged(ref _commaDelimited, value); }
        }
        public bool ArrayParameter
        {
            get { return _arrayParameter; }
            set { this.RaiseAndSetIfChanged(ref _arrayParameter, value); }
        }
        public SimpleCommand ResetCommand
        {
            get { return _resetCommand; }
            set { this.RaiseAndSetIfChanged(ref _resetCommand, value); }
        }

        /// <summary>
        /// Possible settings for parameter, with explanation description
        /// </summary>
        public ObservableCollection<WebServiceParameterSettingViewModel> ParameterSettings { get; set; }

        public WebServiceParameterViewModel() 
        {
            _name = "";
            _description = "";
            _value = "";
            _defaultValue = "";
            _useParameter = false;

            Init();

        }
        public WebServiceParameterViewModel(string name, string description, string value, bool useParameter)
        {
            _name = name;
            _description = description;
            _value = value;
            _defaultValue = value;
            _useParameter = useParameter;

            Init();
        }

        private void Init()
        {
            this.ParameterSettings = new ObservableCollection<WebServiceParameterSettingViewModel>();

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
