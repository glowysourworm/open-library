using System;
using System.Windows;

using OpenLibrary.Controller;
using OpenLibrary.ViewModel;

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
            // _controller.StartWebBots();
        }
    }
}
