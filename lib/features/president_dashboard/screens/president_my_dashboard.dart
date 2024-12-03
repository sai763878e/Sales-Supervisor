import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sales_supervisor/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/dashboard_component_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_report_ids.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/dashboard_components/dashboard_pie_chart_component.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';

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
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Row(
            children: [
              DashboardComponent(controller,
                  controller.dashComponentsList[DashboardReportIds.SSP_LSSP]!),
              DashboardComponent(controller,
                  controller.dashComponentsList[DashboardReportIds.SSP_LSSP]!),
              DashboardComponent(controller,
                  controller.dashComponentsList[DashboardReportIds.SSP_LSSP]!),
            ],
          ),
        ),
      ),
      // DashboardComponent(controller,
      //     controller.dashComponentsList[DashboardReportIds.PHOD_LPHOD]!),
      // DashboardComponent(controller,
      //     controller.dashComponentsList[DashboardReportIds.PHOD_LPHOD]!),
      // DashboardComponent(controller,
      //     controller.dashComponentsList[DashboardReportIds.PHOD_LPHOD]!),
      // DashboardComponent(controller,
      //     controller.dashComponentsList[DashboardReportIds.PHOD_LPHOD]!),
    ]));
  }
}

class DashboardComponent extends StatelessWidget {
  PresidentMyDashboardController presidentMyDashboardController;
  Rx<DashboardComponentModel> model;

  DashboardComponent(this.presidentMyDashboardController, this.model,
      {super.key});

  Widget getWidget(DashboardComponentController controller) {
    return Obx(() => DashboardPieChartComponent(
        isLoading: controller.model.value.isLoading,
        charData: controller.model.value.charData));
  }

  @override
  Widget build(BuildContext context) {
    DashboardComponentController controller = Get.put(
        DashboardComponentController(presidentMyDashboardController, model),
    tag: '${++presidentMyDashboardController.dashboardComponentInstances}');
    return getWidget(controller);
  }
}
