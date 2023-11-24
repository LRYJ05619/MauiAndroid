using CommunityToolkit.Mvvm.ComponentModel;
using Console.Serivices.Server;
using LiveChartsCore;
using LiveChartsCore.Defaults;
using LiveChartsCore.Drawing;
using LiveChartsCore.Measure;
using LiveChartsCore.SkiaSharpView;
using LiveChartsCore.SkiaSharpView.Painting;
using SkiaSharp;
using System.Collections.ObjectModel;

namespace Console.ViewModel.MainViewModel
{
    public partial class ConsolePageViewModel : BaseViewModel
    {
        [ObservableProperty]
        private IPaint<LiveChartsCore.SkiaSharpView.Drawing.SkiaSharpDrawingContext> _legendPaint;

        //饼图绘制
        public IEnumerable<ISeries> StatusSeries { get; set; }
        public IEnumerable<ISeries> SolveSeries { get; set; }
        public ISeries[] WarningSeries { get; set; }

        [Obsolete]
        public ConsolePageViewModel
        (
            AlertsCountGetService alertsCountGetReponsitory,
            AlertsDataGetService alertsDataGetReponsitory,
            DeviceGetService deviceGetService,
            ItemIdGetService itemIDGetReponsitory,
            ProxyDeviceGetService proxyDevcieGetService,
            DeviceStatuCountsGetService deviceStatuCountGetReponsitory
        )
            : base
            (
                alertsCountGetReponsitory,
                alertsDataGetReponsitory,
                deviceGetService,
                itemIDGetReponsitory,
                proxyDevcieGetService,
                deviceStatuCountGetReponsitory
            )
        {
            //基础服务
            _ = BasicInfoGetAsync();
            StartTimer(60000);

            //标签设置（解决中文乱码）
            LegendPaint = new SolidColorPaint()
            {
                Color = SKColors.Black,
                SKTypeface = SKFontManager.Default.MatchCharacter('汉')
            };

            var solvePaint = new SolidColorPaint()
            {
                Color = SKColors.DodgerBlue,
                SKTypeface = SKFontManager.Default.MatchCharacter('汉')
            };

            var statusPaint = new SolidColorPaint()
            {
                Color = SKColors.LimeGreen,
                SKTypeface = SKFontManager.Default.MatchCharacter('汉')
            };

            StatusSeries = new GaugeBuilder()
                .WithLabelsSize(10)
                .WithLabelsPosition(PolarLabelsPosition.ChartCenter)
                .WithLabelFormatter(point => $"在线比率\n   {DevicePollingValue.Value}%")

                .WithInnerRadius(37)
                .WithMaxColumnWidth(25)
                .WithBackground(null)

                .AddValue(DevicePollingValue, "在线比率", statusPaint, statusPaint)

                .BuildSeries();

            SolveSeries = new GaugeBuilder()
                .WithLabelsSize(10)
                .WithLabelsPosition(PolarLabelsPosition.ChartCenter)
                .WithLabelFormatter(point => $"巡检比率\n {PollingValue.Value}%")

                .WithInnerRadius(35)
                .WithMaxColumnWidth(25)
                .WithBackground(null)

                .AddValue(PollingValue, "巡检比率", solvePaint, solvePaint)

                .BuildSeries();


            WarningSeries = new ISeries[]
            {
                new PieSeries<ObservableValue>
                {
                    Values = new ObservableCollection<ObservableValue> { Allleave1Value },
                    InnerRadius = 42,
                    Name = "轻度预警",
                    Fill = new SolidColorPaint(SKColors.Yellow),
                },

                new PieSeries<ObservableValue>
                {
                    Values = new ObservableCollection<ObservableValue> { Allleave2Value },
                    InnerRadius = 42,
                    Name = "中度预警",
                    Fill = new SolidColorPaint(SKColors.Orange),
                },

                new PieSeries<ObservableValue>
                {
                    Values = new ObservableCollection<ObservableValue> { Allleave3Value },
                    InnerRadius = 42,
                    Name = "重度预警",
                    Fill = new SolidColorPaint(SKColors.Red),
                }
            };
        }
    }
}
