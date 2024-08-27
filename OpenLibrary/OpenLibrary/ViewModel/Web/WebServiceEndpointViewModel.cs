
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Windows;

using OpenLibrary.Web.Common;

using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Collection;
using WpfCustomUtilities.Extensions.Command;
using WpfCustomUtilities.Extensions.Event;
using WpfCustomUtilities.Extensions.ObservableCollection;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceEndpointViewModel : ViewModelBase
    {
        string _name;
        string _description;
        string _endpoint;
        string _referenceUrl;
        bool _sslRequired;
        SimpleCommand _executeCommand;
        SimpleCommand _navigateToCommand;
        SimpleCommand _copyToClipboardCommand;

        public event SimpleEventHandler<WebServiceEndpointViewModel> ExecuteEvent;
        public event SimpleEventHandler<WebServiceEndpointViewModel> NavigateToEvent;

        public string Name
        {
            get { return _name; }
            set { this.RaiseAndSetIfChanged(ref _name, value); }
        }
        public string Description
        {
            get { return _description; }
            set { this.RaiseAndSetIfChanged(ref _description, value); }
        }
        public string Endpoint
        {
            get { return _endpoint; }
            set { this.RaiseAndSetIfChanged(ref _endpoint, value); }
        }
        public string ReferenceUrl
        {
            get { return _referenceUrl; }
            set { this.RaiseAndSetIfChanged(ref _referenceUrl, value); }
        }
        public string ResolvedUrl
        {
            get { return GetResolvedUrl(); }
        }
        public bool SslRequired
        {
            get { return _sslRequired; }
            set { this.RaiseAndSetIfChanged(ref _sslRequired, value); }
        }
        public SimpleCommand ExecuteCommand
        {
            get { return _executeCommand; }
            set { this.RaiseAndSetIfChanged(ref _executeCommand, value); }
        }
        public SimpleCommand NavigateToCommand
        {
            get { return _navigateToCommand; }
            set { this.RaiseAndSetIfChanged(ref _navigateToCommand, value); }
        }
        public SimpleCommand CopyToClipboardCommand
        {
            get { return _copyToClipboardCommand; }
            set { this.RaiseAndSetIfChanged(ref _copyToClipboardCommand, value); }
        }


        public NotifyingObservableCollection<WebServiceParameterViewModel> MandatoryParameters { get; set; }
        public NotifyingObservableCollection<WebServiceParameterViewModel> OptionalParameters { get; set; }

        public WebServiceEndpointViewModel()
        {
            this.MandatoryParameters = new NotifyingObservableCollection<WebServiceParameterViewModel>();
            this.OptionalParameters = new NotifyingObservableCollection<WebServiceParameterViewModel>();
            this.Name = "";
            this.Description = "";
            this.Endpoint = "";
            this.ReferenceUrl = "";
            this.SslRequired = false;

            this.ExecuteCommand = new SimpleCommand(() =>
            {
                if (this.ExecuteEvent != null)
                    this.ExecuteEvent(this);
            });
            this.NavigateToCommand = new SimpleCommand(() =>
            {
                if (this.NavigateToEvent != null)
                    this.NavigateToEvent(this);
            });
            this.CopyToClipboardCommand = new SimpleCommand(() =>
            {
                Clipboard.SetText(GetResolvedUrl());
            });

            this.PropertyChanged += OnPropertyChanged;

            this.MandatoryParameters.ItemPropertyChanged += OnParametersChanged;
            this.OptionalParameters.ItemPropertyChanged += OnParametersChanged;
        }
        public IEnumerable<QueryParameter> GetParameters()
        {
            var result = new List<QueryParameter>();

            foreach (var parameter in this.MandatoryParameters)
            {
                result.Add(new QueryParameter(parameter.Name, parameter.Value));
            }

            foreach (var parameter in this.OptionalParameters)
            {
                if (parameter.UseParameter)
                    result.Add(new QueryParameter(parameter.Name, parameter.Value));
            }

            return result;
        }

        private void OnParametersChanged(NotifyingObservableCollection<WebServiceParameterViewModel> item1,
                                         WebServiceParameterViewModel item2,
                                         PropertyChangedEventArgs item3)
        {
            base.OnPropertyChanged("ResolvedUrl");
        }

        private void OnPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName != "ResolvedUrl")
                base.OnPropertyChanged("ResolvedUrl");
        }

        private string GetResolvedUrl()
        {
            var builder = new UriBuilder(this.Endpoint);

            // See ToString()
            var paramStr = this.MandatoryParameters.Where(x => x.UseParameter).Join("&", x => x.ToString()) + "&" +
                           this.OptionalParameters.Where(y => y.UseParameter).Join("&", y => y.ToString());

            builder.Query = paramStr.TrimEnd(new char[] { '&' });

            return builder.ToString();
        }
    }
}
