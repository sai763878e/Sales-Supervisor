import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/chart_data_model.dart';
import '../../../models/dashboard_single_barchart_model.dart';
import '../../../models/dual_column_model.dart';

class StackedColumnCharts extends StatelessWidget {
  const StackedColumnCharts({
    super.key,
    required this.chartData,
  });

  final List? chartData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: SfCartesianChart(
          enableAxisAnimation: true,
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          primaryXAxis: CategoryAxis(
            initialVisibleMaximum: 3.0,
            initialVisibleMinimum: 0.0,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries>[
            StackedColumnSeries(
              dataSource: chartData,
              xValueMapper: ( data, _) => data[0],
              yValueMapper: ( data, _) => data[1],
              dataLabelMapper: (data, _) => '${data[1]}',

              name: 'Sell In',
              color: Colors.blue,
            ),
            StackedColumnSeries(
              dataSource: chartData,
              xValueMapper: (data, _) => data[0],
              yValueMapper: (data, _) => data[2],
              dataLabelMapper: (data, _) => '${data[2]}',

              name: 'Sell Through',
              color: Colors.orange,
            ),
            StackedColumnSeries(
              dataSource: chartData,
              xValueMapper: (data, _) => data[0],
              yValueMapper: (data, _) => data[3],
              dataLabelMapper: (data, _) => '${data[3]}',

              name: 'Sell Out',
              color: Colors.green,
            ),

          ],
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(fontSize: 15),
              iconHeight: 20,
              iconWidth: 20),
          // annotations: chartData
          //     ?.map((chart) => CartesianChartAnnotation(
          //     widget: Text('${chart[3]}'),
          //     coordinateUnit: CoordinateUnit.point,
          //     x: chart[0],
          //     y: chart[2]))
          //     .toList(),
        ),
      ),
    );
  }
}
