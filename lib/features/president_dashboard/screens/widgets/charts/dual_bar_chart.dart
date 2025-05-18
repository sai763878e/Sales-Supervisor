import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dual Bar Chart with Syncfusion")),
        body: DualBarChart(),
      ),
    );
  }
}

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    showFull(){
      Get.bottomSheet(
          // ignoreSafeArea: true,
          // barrierColor: Colors.transparent.withValues(alpha: 0.3),
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(CSizes.borderRadiusXLg),
          //     topRight: Radius.circular(CSizes.borderRadiusXLg),
          //     bottomLeft: Radius.zero,
          //     bottomRight: Radius.zero,
          //   ),
          // ),
          isScrollControlled: true,
          // Allow full height

          // backgroundColor:
          // isDark ? CColors.darkContainer : CColors.lightContainer,
          Container(
            child: Text("sai"),
          ));
    }

    return Container(
      child: IconButton(onPressed: showFull(), icon: Icon(Icons.fullscreen,color: Colors.green,size: 45,)),
    );
  }

}

class ChartData {
  final String month;
  final double sales;
  final double revenue;

  ChartData(this.month, this.sales, this.revenue);
}

class DualBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data for the chart
    final List<ChartData> chartData = [
      ChartData('Jan', 1200, 3000),
      ChartData('Feb', 1500, 4000),
      ChartData('Mar', 800, 2800),
      ChartData('Apr', 1400, 3500),
      ChartData('May', 1700, 5000),
      ChartData('Jun', 2000, 4200),
      ChartData('Jul', 1800, 3800),
      ChartData('Aug', 1600, 4500),
      ChartData('Sep', 1900, 4800),
      ChartData('Oct', 2100, 5200),
      ChartData('Nov', 2300, 6100),
      ChartData('Dec', 2500, 6400),
    ];

    return SfCartesianChart(
      title: ChartTitle(text: 'Sales and Revenue Analysis'),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      primaryXAxis: CategoryAxis(), // X-axis for months
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Sales')), // Y-axis for Sales
      axes: [
        NumericAxis(
          name: 'RevenueAxis',
          opposedPosition: true, // Position on the opposite side
          title: AxisTitle(text: 'Revenue'),
        ),
      ],
      series: <CartesianSeries>[
        // Bar series for Sales
        BarSeries<ChartData, String>(
          name: 'Sales',
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.sales,
          dataLabelSettings: DataLabelSettings(isVisible: true,labelPosition: ChartDataLabelPosition.inside),
        ),
        // Bar series for Revenue (mapped to secondary axis)
        BarSeries<ChartData, String>(
          name: 'Revenue',
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.revenue,
          yAxisName: 'RevenueAxis', // Links to the secondary axis
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
