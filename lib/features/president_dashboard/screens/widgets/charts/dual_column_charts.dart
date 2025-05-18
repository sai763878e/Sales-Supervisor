import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/chart_data_model.dart';
import '../../../models/dashboard_single_barchart_model.dart';
import '../../../models/dual_column_model.dart';

class DualColumnCharts extends StatelessWidget {
  const DualColumnCharts({
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
            initialVisibleMaximum: 2.0,
            initialVisibleMinimum: 0.0,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries>[
            ColumnSeries(
              // width: 0.8, // Sets the width of the bars (30% of available space)
              // spacing: 0.2,
              name: (chartData != null && chartData!.isNotEmpty)
                  ? chartData![0][4]
                  : "",
              dataSource: chartData,
              xValueMapper: (data, _) => data[0],
              yValueMapper: (data, _) => data[1],
              dataLabelMapper: (data, _) => '${data[1]}',
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                labelAlignment: ChartDataLabelAlignment.outer,
                // useSeriesColor: true,
                angle: 0, /*overflowMode: OverflowMode.shift*/
              ),
              width: chartData != null
                  ? chartData!.length > 5
                      ? 1
                      : 0.3
                  : 1,
              // Set fixed width for the columns (e.g., 10% of the total width)
              spacing: chartData != null
                  ? chartData!.length > 5
                      ? 0.2
                      : 0.0
                  : 1,

              sortingOrder: SortingOrder.descending,
              // Sorting based on the specified field
              sortFieldValueMapper: (data, _) => data[1],
              pointColorMapper: (data, _) => data[6],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(CSizes.singleBarChartRadius),
                  topLeft: Radius.circular(CSizes.singleBarChartRadius)),

              // width: 0.8,
            ),
            ColumnSeries(
              // width: 0.8, // Sets the width of the bars (30% of available space)
              // spacing: 0.2,
              name: (chartData != null && chartData!.isNotEmpty)
                  ? chartData![0][5]
                  : "",
              dataSource: chartData,
              xValueMapper: (data, _) => data[0],
              yValueMapper: (data, _) => data[2],
              dataLabelMapper: (data, _) => '${data[2]}',
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.inside,
                labelAlignment: ChartDataLabelAlignment.top,
                // useSeriesColor: true,
                angle: 0, /*overflowMode: OverflowMode.shift*/
              ),
              width: chartData != null
                  ? chartData!.length > 5
                      ? 1
                      : 0.3
                  : 1,
              // Set fixed width for the columns (e.g., 10% of the total width)
              spacing: chartData != null
                  ? chartData!.length > 5
                      ? 0.2
                      : 0.0
                  : 1,

              sortingOrder: SortingOrder.descending,
              // Sorting based on the specified field
              sortFieldValueMapper: (data, _) => data[2],
              pointColorMapper: (data, _) => data[7],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(CSizes.singleBarChartRadius),
                  topLeft: Radius.circular(CSizes.singleBarChartRadius)),

              // width: 0.8,
            ),
          ],
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(fontSize: 15),
              iconHeight: 20,
              iconWidth: 20),
          annotations: chartData
              ?.map((chart) => CartesianChartAnnotation(
                  widget: Text('${chart[3]}'),
                  coordinateUnit: CoordinateUnit.point,
                  x: chart[0],
                  y: chart[2]))
              .toList(),
        ),
      ),
    );
  }
}
