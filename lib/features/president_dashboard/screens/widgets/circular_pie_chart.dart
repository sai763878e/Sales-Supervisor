import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularPieChart extends StatelessWidget {
  const CircularPieChart({super.key, required this.chartData, });

  final List chartData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child:SfCircularChart(
          margin: EdgeInsets.all(0),

          series: [
            PieSeries(
              dataSource: chartData,
              yValueMapper: (data,_) => data[0],
              xValueMapper: (data,_) => data[1],
              radius: '70%',
              explode: true,
              pointColorMapper: (data,_) => data[2],
              dataLabelMapper: (data,_) => data[0].toString(),
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside
              ),
            ),

          ],

          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            orientation: LegendItemOrientation.vertical,
            textStyle: TextStyle(fontSize: 15),
            iconHeight: 20,iconWidth: 20
          ),

        ),
      ),
    );
  }
}
