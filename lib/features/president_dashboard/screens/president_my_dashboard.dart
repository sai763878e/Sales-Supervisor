import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sales_supervisor/common/widgets/choice_chip/choice_chip.dart';
import 'package:sales_supervisor/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/dashboard_component_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/dashboard_pie_chart_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_report_ids.dart';
import 'package:sales_supervisor/features/president_dashboard/models/location_filter_model.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/charts/dual_bar_chart.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/dashboard_components/dashboard_component.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/dashboard_components/dashboard_dual_barchart_component.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/dashboard_components/dashboard_dual_barchart_multiselect_component.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/dashboard_components/dashboard_pie_chart_component.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/dashboard_components/dashboard_single_barchart_component.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/dashboard_components/dashboard_single_barchart_multiselect_component.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/helpers/helper_functions.dart';

class PresidentMyDashboard extends StatelessWidget {
  PresidentMyDashboard({super.key});

  List charData = [
    [10, 'Protein', Colors.purple],
    [50, 'Carbs', Colors.yellow],
    [10, 'Fats', Colors.indigo],
    [30, 'Calories', Colors.orange],
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PresidentMyDashboardController());
    // Get.create<DashboardPieChartController>(() => DashboardPieChartController());
    final isDark = CHelperFunction.isDarkMode(context);

    // return ListView(
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   physics: AlwaysScrollableScrollPhysics(),
    //   children: [
    //     SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           DashboardComponent(controller,controller.dashComponentsList[DashboardReportIds.PHOD_LPHOD]!),
    //           DashboardComponent(controller,controller.dashComponentsList[DashboardReportIds.PHOD_LPHOD]!),
    //           DashboardComponent(controller,controller.dashComponentsList[DashboardReportIds.PHOD_LPHOD]!),
    //         ],
    //       ),
    //     ),
    //     DashboardPieChartComponent(
    //       title: "Zone Sales Performance Value",
    //       subTitle: "Dec 2024",
    //       charData: charData,
    //     ),
    //     DashboardPieChartComponent(
    //       title: "Zone Sales Performance Value",
    //       subTitle: "Dec 2024",
    //       charData: charData,
    //     ),
    //     DashboardPieChartComponent(
    //       title: "Zone Sales Performance Value",
    //       subTitle: "Dec 2024",
    //       charData: charData,
    //     ),
    //     DashboardPieChartComponent(
    //       title: "Zone Sales Performance Value",
    //       subTitle: "Dec 2024",
    //       charData: charData,
    //     ),
    //   ],
    // );
    return controller.isPageLoading.value
        ? Shimmer.fromColors(
            baseColor: isDark ? Colors.grey.shade600 : Colors.grey.shade100,
            highlightColor:
                isDark ? Colors.grey.shade500 : Colors.white.withOpacity(1),
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )
        : SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///Location Filters
            Obx(
              () => SizedBox(
                height: 50,
                child: controller.isLocationFilterLoading.value
                    ? Shimmer.fromColors(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDark ? Colors.black : Colors.white,
                          ),
                        ),
                        baseColor: isDark
                            ? Colors.grey.shade600
                            : Colors.grey.shade100,
                        highlightColor: isDark
                            ? Colors.grey.shade500
                            : Colors.white.withOpacity(1),
                      )
                    : Obx(
                        () => ListView.builder(
                            itemCount:
                                controller.locationTypesList.value.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: ChoiceChip(
                                  label: Text(
                                    controller.locationTypesList.value[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(fontSize: 14),
                                  ),
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                              );
                            }),
                      ),
              ),
            ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //         left: CSizes.defaultSpace / 2,
            //         bottom: CSizes.defaultSpace / 2),
            //     child: Row(
            //       children: [
            //         DashboardComponent(
            //             presidentMyDashboardController: controller,
            //             componentModel: controller
            //                 .dashComponentsList[DashboardReportIds
            //                 .SSP_LSSP]!),
            //         DashboardComponent(
            //             presidentMyDashboardController: controller,
            //             componentModel: controller
            //                 .dashComponentsList[DashboardReportIds
            //                 .SSP_CSSP]!),
            //         DashboardComponent(
            //             presidentMyDashboardController: controller,
            //             componentModel: controller
            //                 .dashComponentsList[DashboardReportIds
            //                 .SSP_SSSP]!),
            //       ],
            //     ),
            //   ),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //         left: CSizes.defaultSpace / 2,
            //         bottom: CSizes.defaultSpace / 2),
            //     child: Row(
            //       children: [
            //         //TODO Target vs Achicevement Chart Need to implement here
            //
            //         DashboardComponent(
            //             presidentMyDashboardController: controller,
            //             componentModel: controller
            //                 .dashComponentsList[DashboardReportIds.SSTA_CSSTA]!),
            //         DashboardComponent(
            //             presidentMyDashboardController: controller,
            //             componentModel: controller
            //                 .dashComponentsList[DashboardReportIds.SSTA_SSSTA]!),
            //
            //       ],
            //     ),
            //   ),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //         left: CSizes.defaultSpace / 2,
            //         bottom: CSizes.defaultSpace / 2),
            //     child: Row(
            //       children: [
            //         DashboardComponent(
            //             presidentMyDashboardController: controller,
            //             componentModel: controller
            //                 .dashComponentsList[DashboardReportIds.SPP_LSPP]!),
            //         // DualBarChart(),
            //       ],
            //     ),
            //   ),
            // ),
            //   SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Padding(
            //       padding: const EdgeInsets.only(
            //           left: CSizes.defaultSpace / 2,
            //           bottom: CSizes.defaultSpace / 2),
            //       child: Row(
            //         children: [
            //           DashboardComponent(
            //               presidentMyDashboardController: controller,
            //               componentModel: controller
            //                   .dashComponentsList[DashboardReportIds.CDSP_CCDSP]!),
            //           // DualBarChart(),
            //         ],
            //       ),
            //     ),
            //   ),
          ]));
  }
}
