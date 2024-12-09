import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/dashboard_pie_chart_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/dashboard_single_barchart_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_pie_chart_model.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/charts/column_charts.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/charts/circular_donought_pie_chart.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class DashboardSingleBarchartComponent extends StatelessWidget {
  DashboardSingleBarchartComponent({
    super.key,
    required this.presidentMyDashboardController,
    required this.componentModel,
  });

  PresidentMyDashboardController presidentMyDashboardController;
  Rx<DashboardComponentModel> componentModel;

  // List charData = [
  //   [10, 'Protein', Colors.purple],
  //   [50, 'Carbs', Colors.yellow],
  //   [10, 'Fats', Colors.indigo],
  //   [30, 'Calories', Colors.orange],
  // ];

  final cardRadius = 15.0;

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);

    final controller = Get.put(
        DashboardSingleBarchartController(
            presidentMyDashboardController, componentModel),
        tag: componentModel.value.reportWindowId);
    // controller ??= DashboardPieChartController();

    return Obx(
      () => Padding(
        padding: EdgeInsets.all(10),
        child: componentModel.value.isLoading
            ? Shimmer.fromColors(
                child: Container(
                  width: CHelperFunction.screenWidth() * 0.85,
                  height: CSizes.dashboardComponent,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(cardRadius),

                    // boxShadow: [
                    //   BoxShadow(
                    //       color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                    //       // offset: Offset(3, 3),
                    //       blurRadius: 10,
                    //       spreadRadius: 1),
                    //   BoxShadow(
                    //       color: isDark
                    //           ? Colors.grey.shade900
                    //           : Colors.white.withOpacity(0.5),
                    //       // offset: Offset(-2, -2),
                    //       blurRadius: 10,
                    //       spreadRadius: 1)
                    // ],
                  ),
                ),
                baseColor: isDark ? Colors.grey.shade600 : Colors.grey.shade100,
                highlightColor:
                    isDark ? Colors.grey.shade500 : Colors.white.withOpacity(1),
              )
            : Container(
                width: CHelperFunction.screenWidth() * 0.85,
                height: CSizes.dashboardComponent,
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(cardRadius),
                  boxShadow: [
                    BoxShadow(
                        color: isDark
                            ? Colors.grey.shade700
                            : Colors.grey.shade300,
                        offset: Offset(3, 3),
                        blurRadius: 10,
                        spreadRadius: 1),
                    BoxShadow(
                        color: isDark
                            ? Colors.grey.shade900
                            : Colors.white.withOpacity(0.5),
                        offset: Offset(-2, -2),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ],
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(CSizes.defaultSpace / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.dashboardPieChartModelMap[
                                          controller.selectedView.value] !=
                                      null
                                  ? controller
                                      .dashboardPieChartModelMap[
                                          controller.selectedView.value]!
                                      .title
                                  : "",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              controller.dashboardPieChartModelMap[
                                          controller.selectedView.value] !=
                                      null
                                  ? controller
                                      .dashboardPieChartModelMap[
                                          controller.selectedView.value]!
                                      .subTitle
                                  : "",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),

                            // Container(
                            //   child: CircularDonoughtPieChart(
                            //     chartData: controller.dashboardPieChartModelMap[controller.selectedView.value] !=
                            //         null ? controller.dashboardPieChartModelMap[controller.selectedView.value]!
                            //         .chartData : [],
                            //     isHorizontal: true,
                            //     isVisible: false,
                            //   ),
                            // ),
                          ],
                        ),
                      ),

                      Flexible(
                        flex: 1,
                        child: ColumnCharts(
                          chartData: controller.dashboardPieChartModelMap[
                                      controller.selectedView.value] !=
                                  null
                              ? controller
                                  .dashboardPieChartModelMap[
                                      controller.selectedView.value]!
                                  .chartData
                              : [],
                        ),
                      ),
                      // Spacer(),
                      Container(
                        // color: Colors.blue.shade100,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(cardRadius),
                                bottomRight: Radius.circular(cardRadius))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                CupertinoIcons.fullscreen,
                                color: Colors.green,
                              ),
                              GestureDetector(
                                onTap: () => controller.changeAllHighEndViews(),
                                child: Text(
                                  controller.viewAll.value
                                      ? AppLanguageUtils.instance.switchToHiEnd
                                      : AppLanguageUtils.instance.switchToAll,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue.shade500),
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    controller.changeValueVolumeViews(),
                                child: Text(
                                  controller.viewValue.value
                                      ? AppLanguageUtils.instance.switchToVolume
                                      : AppLanguageUtils.instance.switchToValue,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue.shade500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
