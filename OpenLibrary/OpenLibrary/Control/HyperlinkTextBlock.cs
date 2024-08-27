using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace OpenLibrary.Control
{
    public class HyperlinkTextBlock : TextBlock
    {
        public static readonly DependencyProperty UrlProperty =
            DependencyProperty.Register("Url", typeof(string), typeof(HyperlinkTextBlock));

        public string Url
        {
            get { return (string)GetValue(UrlProperty); }
            set { SetValue(UrlProperty, value); }
        }

        public HyperlinkTextBlock()
        {
            // Default Style
            this.Foreground = Brushes.Blue;
            this.TextDecorations.Add(new TextDecoration()
            {
                Location = TextDecorationLocation.Underline,
                Pen = new Pen(Brushes.Blue, 1),
                PenOffset = 1,
                PenOffsetUnit = TextDecorationUnit.FontRecommended,
                PenThicknessUnit = TextDecorationUnit.FontRecommended
            });
            this.Cursor = Cursors.Hand;
        }

        protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
        {
            // Go ahead and leave application to run
            if (string.IsNullOrWhiteSpace(this.Url))
                return;

            // Navigate to default browser with the Url
            System.Diagnostics.Process.Start(this.Url);
        }
    }
}
