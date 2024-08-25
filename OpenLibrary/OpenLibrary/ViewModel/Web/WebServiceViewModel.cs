﻿using System;
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
    public class WebServiceViewModel : ViewModelBase
    {
        string _name;
        string _description;
        string _endpoint;
        string _referenceUrl;
        SimpleCommand _executeCommand;
        SimpleCommand _copyToClipboardCommand;

        public event SimpleEventHandler<WebServiceViewModel> ExecuteEvent;

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
        public SimpleCommand CopyToClipboardCommand
        {
            get { return _copyToClipboardCommand; }
            set { this.RaiseAndSetIfChanged(ref _copyToClipboardCommand, value); }
        }
        public SimpleCommand ExecuteCommand
        {
            get { return _executeCommand; }
            set { this.RaiseAndSetIfChanged(ref _executeCommand, value); }
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

        public NotifyingObservableCollection<WebServiceParameter> MandatoryParameters { get; set; }
        public NotifyingObservableCollection<WebServiceParameter> OptionalParameters { get; set; }

        public WebServiceViewModel()
        {
            this.MandatoryParameters = new NotifyingObservableCollection<WebServiceParameter>();
            this.OptionalParameters = new NotifyingObservableCollection<WebServiceParameter>();
            this.Name = "Default Web Service";
            this.Description = "A default seb service";
            this.Endpoint = "www.google.com";
            this.ReferenceUrl = "www.google.com";

            this.ExecuteCommand = new SimpleCommand(() =>
            {
                if (this.ExecuteEvent != null)
                    this.ExecuteEvent(this);
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

        private void OnParametersChanged(NotifyingObservableCollection<WebServiceParameter> item1,
                                         WebServiceParameter item2,
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
