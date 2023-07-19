using Console.Model;
using Newtonsoft.Json;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Console.Serivices;
using System.Collections.ObjectModel;
using System.Diagnostics;
using Console.Serivices.Interface;
using Console.Serivices.Server;
using LiveChartsCore.Defaults;
using LiveChartsCore.Measure;
using LiveChartsCore.SkiaSharpView;
using LiveChartsCore;
using LiveChartsCore.SkiaSharpView.Painting;
using SkiaSharp;
using Android.Text;
using LiveChartsCore.Drawing;
using AndroidX.Lifecycle;

namespace Console.ViewModel.MainViewModel
{
    public partial class ConsolePageViewModel : BaseViewModel
    {
        [ObservableProperty]
        private IPaint<LiveChartsCore.SkiaSharpView.Drawing.SkiaSharpDrawingContext> legendPaint;

        //饼图绘制
        public IEnumerable<ISeries> SolveSeries { get; set; }
        public ISeries[] WarningSeries { get; set; }

        [Obsolete]
        public ConsolePageViewModel
        (
            AlertsCountGetService alertsCountGetReponsitory,
            AlertsDataGetService alertsDataGetReponsitory,
            DeviceGetService deviceGetService,
            ItemIdGetService itemIDGetReponsitory,
            ProxyDeviceGetService proxyDevcieGetService
        )
            : base
            (
                alertsCountGetReponsitory,
                alertsDataGetReponsitory,
                deviceGetService,
                itemIDGetReponsitory,
                proxyDevcieGetService
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

            SolveSeries = new GaugeBuilder()
                .WithLabelsSize(35)
                .WithLabelsPosition(PolarLabelsPosition.ChartCenter)
                .WithLabelFormatter(point => $"巡检比率\n {PollingValue.Value}%")

                .WithInnerRadius(20)
                .WithMaxColumnWidth(15)
                .WithBackground(null)

                .AddValue(PollingValue, "巡检比率", solvePaint, solvePaint)

                .BuildSeries();


            WarningSeries = new ISeries[]
            {
                new PieSeries<ObservableValue>
                {
                    Values = new ObservableCollection<ObservableValue> { Allleave1Value }, 
                    InnerRadius = 128,
                    Name = "轻度预警",
                    Fill = new SolidColorPaint(SKColors.Yellow),
                },

                new PieSeries<ObservableValue>
                {
                    Values = new ObservableCollection<ObservableValue> { Allleave2Value }, InnerRadius = 128,
                    Name = "中度预警",
                    Fill = new SolidColorPaint(SKColors.Orange),
                },

                new PieSeries<ObservableValue>
                {
                    Values = new ObservableCollection<ObservableValue> { Allleave3Value },
                    InnerRadius = 128,
                    Name = "重度预警",
                    Fill = new SolidColorPaint(SKColors.Red),
                }
            };
        }
    }
}
