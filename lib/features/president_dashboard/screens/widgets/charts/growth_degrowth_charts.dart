import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrowthDegrowthCharts extends StatelessWidget {
  const GrowthDegrowthCharts({
    super.key,
    required this.chartData,
  });

  final List? chartData;

  // late ZoomPanBehavior _zoomPanBehavior;
  // late ChartAxis _xAxisController;

  @override
  Widget build(BuildContext context) {

    // Initialize ZoomPanBehavior
    ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true, // Enables scrolling
      enableDoubleTapZooming: false,
      enableSelectionZooming: false,
      enablePinching: false,
    );

    // Create a shared X-axis for synchronization
    ChartAxis _xAxisController = CategoryAxis(
        isVisible: true,
        labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w500,),
        labelAlignment: LabelAlignment.center,
        labelPlacement: LabelPlacement.betweenTicks,
        initialVisibleMaximum: 2.0,
        initialVisibleMinimum: 0.0,
    );

    ScrollController _scrollController = ScrollController();

    return Center(
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
                child: SfCartesianChart(
                    enableAxisAnimation: true,

                    // primaryXAxis: _xAxisController, // Shared X-axis controller
                    // zoomPanBehavior: _zoomPanBehavior, // Shared ZoomPanBehavior

                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true,
                    ),
                    primaryXAxis:  CategoryAxis(
                      isVisible: true,
                      labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 0),
                      // majorGridLines: MajorGridLines(width: 1), // Hide X grid lines
                      // majorTickLines: MajorTickLines(size: 1), // Hide X ticks

                      initialVisibleMaximum: 2.0,
                      initialVisibleMinimum: 0.0,
                      autoScrollingMode: AutoScrollingMode.start, // Auto-scroll to start
                    ),
                    primaryYAxis: const NumericAxis(
                      isVisible: false,
                    ),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries>[
                  BarSeries(
                    // width: 0.8, // Sets the width of the bars (30% of available space)
                    // spacing: 0.2,
                    dataSource: chartData,
                    xValueMapper: (data, index) => index,
                    yValueMapper: (data, _) => data[4],
                    dataLabelMapper: (data, _) => '${data[4]} %',
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

                    // sortingOrder: SortingOrder.descending,
                    // Sorting based on the specified field
                    // sortFieldValueMapper: (data, _) => data[1],
                    pointColorMapper: (data, _) {
                      if (data[4] > 0)
                        return Colors.green;
                      else
                        return Colors.red;
                    },
                    // borderRadius: BorderRadius.only(
                    //     topRight: Radius.circular(CSizes.singleBarChartRadius),
                    //     topLeft: Radius.circular(CSizes.singleBarChartRadius)),

                    // width: 0.8,
                  ),
                ])),
            Expanded(
              flex: 3,
                child: SfCartesianChart(
                    enableAxisAnimation: true,
                    // primaryXAxis: _xAxisController, // Shared X-axis controller
                    // zoomPanBehavior: _zoomPanBehavior, // Shared ZoomPanBehavior

                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true,
                    ),
                    primaryXAxis: CategoryAxis(
                      isVisible: true,
                      labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w500,),
                      labelAlignment: LabelAlignment.center,
                      labelPlacement: LabelPlacement.betweenTicks,
                      initialVisibleMaximum: 2.0,
                      initialVisibleMinimum: 0.0,
                      autoScrollingMode: AutoScrollingMode.start, // Auto-scroll to start
                    ),
                    primaryYAxis: const NumericAxis(
                      isVisible: false,
                    ),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries>[
                      BarSeries(
                        // width: 0.8, // Sets the width of the bars (30% of available space)
                        // spacing: 0.2,
                        dataSource: chartData,
                        xValueMapper: (data, index) => data[0],
                        yValueMapper: (data, _) => data[2],
                        // dataLabelMapper: (data, _) => '${data[4]}',
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,

                          // labelPosition: ChartDataLabelPosition.outside,
                          // labelAlignment: ChartDataLabelAlignment.top,
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

                        // sortingOrder: SortingOrder.descending,
                        // Sorting based on the specified field
                        // sortFieldValueMapper: (data, _) => data[1],
                        pointColorMapper: (data, _) {
                          // if (data[4] > 0)
                          return Colors.green;
                          // else
                          //   return Colors.red;
                        },
                        // borderRadius: BorderRadius.only(
                        //     topRight: Radius.circular(CSizes.singleBarChartRadius),
                        //     topLeft: Radius.circular(CSizes.singleBarChartRadius)),

                        // width: 0.8,
                      ),
                      BarSeries(
                        // width: 0.8, // Sets the width of the bars (30% of available space)
                        // spacing: 0.2,
                        dataSource: chartData,
                        xValueMapper: (data, index) => data[0],
                        yValueMapper: (data, _) => data[1],
                        // dataLabelMapper: (data, _) => '${data[4]}',
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          // labelPosition: ChartDataLabelPosition.inside,
                          // labelAlignment: ChartDataLabelAlignment.auto,
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

                        // sortingOrder: SortingOrder.descending,
                        // Sorting based on the specified field
                        // sortFieldValueMapper: (data, _) => data[1],
                        pointColorMapper: (data, _) {
                          // if (data[4] > 0)
                          //   return Colors.green;
                          // else
                            return Colors.blueAccent;
                        },
                        // borderRadius: BorderRadius.only(
                        //     topRight: Radius.circular(CSizes.singleBarChartRadius),
                        //     topLeft: Radius.circular(CSizes.singleBarChartRadius)),

                        // width: 0.8,
                      ),
                    ])),

            // Expanded(

          ],
        ),
      ),
    );
  }
}
