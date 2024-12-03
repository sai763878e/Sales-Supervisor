import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class CircularDonoughtPieChart extends StatelessWidget {

  CircularDonoughtPieChart(
      {super.key, required this.chartData, this.isHorizontal = false,this.isVisible = true});

  final List chartData;
  bool isHorizontal;
  bool isVisible;


  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      margin: const EdgeInsets.all(0),

      series: [
        DoughnutSeries(
          animationDuration: 1000 * 1,
          animationDelay: 0,
          innerRadius: '60%',
          dataSource: chartData,
          yValueMapper: (data, _) => data[0],
          xValueMapper: (data, _) => data[1],
          radius: '80%',
          explode: true,
          pointColorMapper: (data, _) => data[2],
          dataLabelMapper: (data, _) => "${data[0]}",
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside
          ),
        ),

      ],

      legend: Legend(
          isVisible: isVisible,
          position: LegendPosition.bottom,
          orientation: isHorizontal
              ? LegendItemOrientation.horizontal
              : LegendItemOrientation.vertical,
          textStyle: TextStyle(fontSize: 15),
          iconHeight: 20,
          iconWidth: 20
      ),

    );
  }
}
