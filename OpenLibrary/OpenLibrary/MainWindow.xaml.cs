using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Xml;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

using OpenLibrary.Data;
using System.Security.Policy;
using System.Globalization;
using WpfCustomUtilities.Extensions;
using System.Threading;
using System.IO;
using OpenLibrary.ViewModel;
using OpenLibrary.Controller;

namespace OpenLibrary
{
    public partial class MainWindow : Window
    {
        readonly OpenLibraryController _controller;

        public MainWindow()
        {
            InitializeComponent();

            var viewModel = new OpenLibraryViewModel();
            
            _controller = new OpenLibraryController(viewModel);

            this.DataContext = viewModel;

            this.Loaded += OnLoaded;
            this.Closed += OnClosed;
        }

        private void OnClosed(object sender, EventArgs e)
        {
            _controller.Dispose();
        }

        private void OnLoaded(object sender, RoutedEventArgs e)
        {
            _controller.StartWebBots();
        }
    }
}
