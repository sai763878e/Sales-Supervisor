import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/chart_data_model.dart';
import '../../../models/dashboard_single_barchart_model.dart';

class ColumnCharts extends StatelessWidget {
  const ColumnCharts({
    super.key,
    required this.chartData,
  });

  final List<ChartData>? chartData;

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
              initialVisibleMaximum: 4.0,
              initialVisibleMinimum: 0.0,
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              ColumnSeries<ChartData, String>(
                // width: 0.8, // Sets the width of the bars (30% of available space)
                // spacing: 0.2,
                dataSource: chartData,
                xValueMapper: (data, _) => data.x,
                yValueMapper: (data, _) => data.y,
                dataLabelMapper: (data, _) => '${data.y}',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  labelAlignment: ChartDataLabelAlignment.outer,
                  useSeriesColor: true,
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
                sortFieldValueMapper: (data, _) => data.y,
                pointColorMapper: (data, _) => Colors.indigo,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(CSizes.singleBarChartRadius),
                    topLeft: Radius.circular(CSizes.singleBarChartRadius)),

                // width: 0.8,
              ),
              // ColumnSeries<ChartData, String>(
              //   // width: 0.8, // Sets the width of the bars (30% of available space)
              //   // spacing: 0.2,
              //   dataSource: chartData,
              //   xValueMapper: (data, _) => data.x,
              //   yValueMapper: (data, _) => data.y,
              //   dataLabelMapper: (data, _) => '${data.y}',
              //   dataLabelSettings: const DataLabelSettings(
              //     isVisible: true,
              //     labelPosition: ChartDataLabelPosition.inside,
              //     useSeriesColor: true,
              //     angle: 0,
              //     /*overflowMode: OverflowMode.shift*/),
              //
              //   sortingOrder: SortingOrder.descending,
              //   // Sorting based on the specified field
              //   sortFieldValueMapper: (data, _) => data.y,
              //   pointColorMapper: (data, _) => Colors.indigo,
              //   borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(CSizes.singleBarChartRadius),
              //       topLeft: Radius.circular(CSizes.singleBarChartRadius)),
              //
              //   // width: 0.8,
              // ),
            ]),
      ),
    );
  }
}
