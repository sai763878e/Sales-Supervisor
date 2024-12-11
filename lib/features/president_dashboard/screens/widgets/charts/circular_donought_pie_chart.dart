import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularDonoughtPieChart extends StatelessWidget {
  CircularDonoughtPieChart(
      {super.key,
      required this.chartData,
      this.isHorizontal = false,
      this.isVisible = true});

  final List chartData;
  bool isHorizontal;
  bool isVisible;
  final _startAngle = 1.0.obs;

  @override
  Widget build(BuildContext context) {
    void _rotateChart(DragUpdateDetails details) {}

    return Obx(
      () => GestureDetector(
        onPanUpdate: (details) {
          _startAngle.value +=
              details.delta.dx; // Adjust rotation sensitivity as needed
          _startAngle.refresh();
        },
        onHorizontalDragUpdate: (details) {
          _startAngle.value +=
              details.delta.dx; // Adjust rotation sensitivity as needed
          _startAngle.refresh();
        },
        child: SfCircularChart(
          margin: const EdgeInsets.all(10),
          series: [
            DoughnutSeries(
              animationDuration: 1000 * 1,
              animationDelay: 1000 * 0.5,
              innerRadius: '55%',
              dataSource: chartData,
              yValueMapper: (data, _) => data[0],
              xValueMapper: (data, _) => data[1],
              radius: '55%',
              explode: true,
              pointColorMapper: (data, _) => data[2],
              dataLabelMapper: (data, _) => "${data[1]} - ${data[0]}",
              dataLabelSettings: const DataLabelSettings(
                  // labelAlignment: ChartDataLabelAlignment.bottom,
                  // labelIntersectAction: LabelIntersectAction.shift,
                  // alignment: ChartAlignment.near,
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  useSeriesColor: true,
                  connectorLineSettings: ConnectorLineSettings(
                      type: ConnectorType.curve, length: '10%')),

              startAngle: _startAngle.value.toInt(),
              // Dynamic start angle
              endAngle: _startAngle.value.toInt() + 360, // Completes the circle
             // Completes the circle
            ),
          ],

          // legend: Legend(
          //     isVisible: isVisible,
          //     position: LegendPosition.bottom,
          //     orientation: isHorizontal
          //         ? LegendItemOrientation.horizontal
          //         : LegendItemOrientation.vertical,
          //     textStyle: TextStyle(fontSize: 15),
          //     iconHeight: 20,
          //     iconWidth: 20
          // ),
        ),
      ),
    );
  }
}
