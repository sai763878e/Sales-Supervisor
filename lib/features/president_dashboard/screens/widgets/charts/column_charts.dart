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
          enableSideBySideSeriesPlacement: true,

            primaryXAxis: CategoryAxis(),
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
                    labelPosition: ChartDataLabelPosition.inside,
                    labelAlignment: ChartDataLabelAlignment.top,
                    useSeriesColor: true,
                    angle: 0,
                    /*overflowMode: OverflowMode.shift*/),

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
