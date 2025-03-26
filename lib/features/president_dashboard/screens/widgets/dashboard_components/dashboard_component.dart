import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sales_supervisor/common/widgets/loaders/loaders.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/dashboard_component_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/dashboard_pie_chart_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/ai_chat_widget.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/charts/circular_donought_pie_chart.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/charts/column_charts.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/charts/dual_column_charts.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/charts/stacked_column_charts.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/dashboard_components/dashboard_table_charts.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/flip_data_component.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:sales_supervisor/utils/helpers/helper_functions.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';
import 'package:shimmer/shimmer.dart';

class DashboardComponent extends StatelessWidget {
  DashboardComponent({
    super.key,
    required this.presidentMyDashboardController,
    required this.componentModel,
    required this.loadRow,
  });

  PresidentMyDashboardController presidentMyDashboardController;
  Rx<DashboardComponentModel> componentModel;
  final Rx<bool> loadRow;

  // Widget chart;

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

    String tableView = "Table View",
        flipData = "Flip Data",
        filter = "Filter",
        duplicate = "Duplicate",
        export = "Export",
        aiAnalysis = "AI Analysis",
        fullScreen = "Full Screen";

    final controller = Get.put(
        DashboardComponentController(
            presidentMyDashboardController, componentModel, loadRow),
        tag: componentModel.value.uuid);
    if (componentModel.value.isLoading) {
      controller.loadDashboard();
    } else {}
    Widget getChartWidget() {
      if (controller.aiAnalysisEnabled.value) {
        return AIChatWidget(message: controller.model.value.aiResponse);
      }
      else if(controller.flipComponentEnabled.value){
        return FlipDataComponent(message: controller.model.value.flipData);
      }
      else {
        if (controller.pieChartModels.contains(componentModel.value.type)) {
          return CircularDonoughtPieChart(
            chartData: controller.dashboardChartModelMap[
                        controller.selectedView.value] !=
                    null
                ? controller
                    .dashboardChartModelMap[controller.selectedView.value]!
                    .chartData[controller.selectedSubView.value]!
                : [],
            isHorizontal: true,
            isVisible: false,
          );
        } else if (controller.singleBarChartModels
            .contains(componentModel.value.type)) {
          return ColumnCharts(
            chartData: controller.dashboardChartModelMap[
                        controller.selectedView.value] !=
                    null
                ? controller
                    .dashboardChartModelMap[controller.selectedView.value]!
                    .chartData[controller.selectedSubView.value]
                : [],
          );
        } else if (controller.dualBarChartModels
            .contains(componentModel.value.type)) {
          return DualColumnCharts(
            chartData: controller.dashboardChartModelMap[
                        controller.selectedView.value] !=
                    null
                ? controller
                    .dashboardChartModelMap[controller.selectedView.value]!
                    .chartData[controller.selectedSubView.value]
                : [],
          );
        }
        else if (controller.stackedChartModels
            .contains(componentModel.value.type)) {
          return StackedColumnCharts(
            chartData: controller.dashboardChartModelMap[
            controller.selectedView.value] !=
                null
                ? controller
                .dashboardChartModelMap[controller.selectedView.value]!
                .chartData[controller.selectedSubView.value]
                : [],
          );
        }
        else if(controller.tableModels
            .contains(componentModel.value.type)){
          return DashboardTableCharts(
            data: controller.dashboardChartModelMap[
            controller.selectedView.value] !=
                null
                ? controller
                .dashboardChartModelMap[controller.selectedView.value]!
                .tableListData[controller.selectedSubView.value]
                : [],
          );
        }
      }

      return Container();
    }

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
                  ),
                ),
                baseColor: isDark ? Colors.grey.shade600 : Colors.grey.shade100,
                highlightColor: isDark
                    ? Colors.grey.shade500
                    : Colors.white.withValues(alpha: 1),
              )
            : RepaintBoundary(
                key: controller.repaintKey,
                child: Container(
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
                              : Colors.white.withValues(alpha: 0.5),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.dashboardChartModelMap[
                                                      controller.selectedView
                                                          .value] !=
                                                  null
                                              ? controller
                                                  .dashboardChartModelMap[
                                                      controller
                                                          .selectedView.value]!
                                                  .title
                                              : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          controller.dashboardChartModelMap[
                                                      controller.selectedView
                                                          .value] !=
                                                  null
                                              ? controller
                                                  .dashboardChartModelMap[
                                                      controller
                                                          .selectedView.value]!
                                                  .subTitle
                                              : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  (controller.selectedSubViewList.isNotEmpty &&
                                          controller
                                                  .selectedSubViewList.length >
                                              1)
                                      ? Obx(
                                          () => DropdownMenu<String>(
                                            width: 100,
                                            enableSearch: true,
                                            initialSelection: controller
                                                .selectedSubView.value,
                                            // menuStyle: MenuStyle(),

                                            dropdownMenuEntries: controller
                                                .selectedSubViewList
                                                .map((value) =>
                                                    DropdownMenuEntry(
                                                        value: value,
                                                        label: (value)))
                                                .toList(),
                                            onSelected: (String? value) =>
                                                controller
                                                    .changeSelectedSubViews(
                                                        value),
                                          ),
                                        )
                                      : SizedBox(),
                                  // IconButton(onPressed: ()=>showP, icon: Icon(Icons.more_vert,))
                                  PopupMenuButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            CSizes.borderRadiusLg)),
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: ListTile(
                                          leading: Icon(CupertinoIcons.table),
                                          title: Text(tableView),
                                        ),
                                        value: tableView,
                                      ),
                                      PopupMenuItem(
                                        child: ListTile(
                                          leading: Icon(CupertinoIcons
                                              .square_fill_line_vertical_square),
                                          title: Text(flipData),
                                        ),
                                        value: flipData,
                                      ),
                                      PopupMenuItem(
                                        child: ListTile(
                                          leading:
                                              Icon(CupertinoIcons.color_filter),
                                          title: Text(filter),
                                        ),
                                        value: filter,
                                      ),
                                      PopupMenuItem(
                                        child: ListTile(
                                          leading: Icon(
                                              Icons.control_point_duplicate),
                                          title: Text(duplicate),
                                        ),
                                        value: duplicate,
                                      ),
                                      PopupMenuItem(
                                        child: ListTile(
                                          leading: Icon(Icons.share),
                                          title: Text(export),
                                        ),
                                        value: export,
                                      ),
                                      PopupMenuItem(
                                        child: ListTile(
                                          leading: Icon(Icons.share),
                                          title: Text(aiAnalysis),
                                        ),
                                        value: aiAnalysis,
                                      ),
                                    ],
                                    onSelected: (newValue) {
                                      CLoader.warningSnackBar(
                                          title: newValue, message: newValue);
                                      if (newValue.isCaseInsensitiveContains(
                                          tableView)) {
                                        controller.tableViewComponent();
                                      } else if (newValue
                                          .isCaseInsensitiveContains(
                                              flipData)) {
                                        controller.flipComponent();
                                      } else if (newValue
                                          .isCaseInsensitiveContains(filter)) {
                                        controller.filterComponent(
                                            context, isDark, controller);
                                      } else if (newValue
                                          .isCaseInsensitiveContains(
                                              duplicate)) {
                                        controller.duplicateComponent();
                                      } else if (newValue
                                          .isCaseInsensitiveContains(export)) {
                                        controller.captureAndShare();
                                      } else if (newValue
                                          .isCaseInsensitiveContains(
                                              aiAnalysis)) {
                                        controller.generateAIAnalysis();
                                      }
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        Flexible(
                          flex: 1,
                          child: getChartWidget(),
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
                                Flexible(
                                  child: Icon(
                                    CupertinoIcons.fullscreen,
                                    color: Colors.green,
                                  ),
                                ),
                                Flexible(
                                  child: Obx(
                                    () => SizedBox(
                                      width: double.infinity,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            // Bottom line when not focused
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 2),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            // Bottom line when focused
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 2),
                                          ),
                                        ),
                                        // width: 100,
                                        // enableSearch: true,
                                        value:
                                            controller.switchViewSelected.value!=null ? controller.switchViewSelected.value: "",

                                        // menuStyle: MenuStyle(),

                                        items: controller.switchViewsList
                                            .map((value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(value)))
                                            .toList(),
                                        onChanged: (String? value) => controller
                                            .changeSwitchSelectedViews(value),
                                      ),
                                    ),
                                  ),
                                ),
                                // if (controller.centerViewsList.isNotEmpty)
                                //   GestureDetector(
                                //     onTap: () => controller.changeCenterViews(),
                                //     child: Text(
                                //       controller.getCenterViewToDisplay(),
                                //       // controller.viewAll.value
                                //       //     ? AppLanguageUtils.instance.switchToHiEnd
                                //       //     : AppLanguageUtils.instance.switchToAll,
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .labelMedium!
                                //           .copyWith(
                                //               fontWeight: FontWeight.w700,
                                //               color: Colors.blue.shade500),
                                //     ),
                                //   ),
                                // if (controller.rightViewsList.isNotEmpty)
                                //   GestureDetector(
                                //     onTap: () => controller.changeRightViews(),
                                //     child: Text(
                                //       controller.getRightViewToDisplay(),
                                //       // controller.viewValue.value
                                //       //     ? AppLanguageUtils.instance.switchToVolume
                                //       //     : AppLanguageUtils.instance.switchToValue,
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .labelMedium!
                                //           .copyWith(
                                //               fontWeight: FontWeight.w700,
                                //               color: Colors.blue.shade500),
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
