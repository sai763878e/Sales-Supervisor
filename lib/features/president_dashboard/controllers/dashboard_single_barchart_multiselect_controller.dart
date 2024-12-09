import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:sales_supervisor/data/repositories/remote/authentication/president_dashboard/president_dashboard_repository.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_pie_chart_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_single_barchart_multiselect_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../models/chart_data_model.dart';
import '../models/dashboard_single_barchart_model.dart';

class DashboardSingleBarchartMultiselectController extends GetxController {
  DashboardSingleBarchartMultiselectController(
    this.presidentMyDashboardController,
    this.model,
  );

  PresidentMyDashboardController presidentMyDashboardController;
  Rx<DashboardComponentModel> model;
  PresidentDashboardRepository presidentDashboardRepository =
      PresidentDashboardRepository.instance;
  final Random random = Random();
  int? id;

  final dashboardChartModelMap =
      <String, DashboardSingleBarchartMultiselectModel>{}.obs;
  final selectedView = "".obs;
  final selectedSubView = "".obs;
  final selectedSubViewList=<String>[].obs;

  final viewAll = true.obs;
  final viewHiEnd = false.obs;
  final viewValue = true.obs;
  final viewVolume = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    id = random.nextInt(256);
    if (kDebugMode) {
      print('load data of $id start at ${DateTime.now()}');
    }
    presidentDashboardRepository
        .getDashboardData(
            userId: presidentMyDashboardController.userId,
            userTypeId: presidentMyDashboardController.userTypeId,
            reportId: model.value.reportId,
            reportWindowId: model.value.reportWindowId,
            filterOptionBase: presidentMyDashboardController.filterOptionBase,
            filterOptionYear:
                '${presidentMyDashboardController.filterOptionYear}',
            filterOptionMonth:
                '${presidentMyDashboardController.filterOptionMonth}',
            locationFilterUID: presidentMyDashboardController.locationFilterUID,
            model: model)
        .then((value) {
      parseDashboard(model);
    });
  }

  parseDashboard(Rx<DashboardComponentModel> model) async {
    try {
      var result = model.value.response!;
      var hasFilters = result["HasFilters"];
      var rightViews = result["RightViews"];
      var centerViews = result["CenterViews"];
      var views = result["Views"] as Map<String, dynamic>;

      views.forEach((key, value) {
        DashboardSingleBarchartMultiselectModel
            dashboardSingleBarchartMultiselectModel =
            DashboardSingleBarchartMultiselectModel();

        dashboardSingleBarchartMultiselectModel.title = value["Title"];
        dashboardSingleBarchartMultiselectModel.subTitle = value["Subtitle"];
        dashboardSingleBarchartMultiselectModel.key = key;

        var header = value["Header"];
        var dataMap = value["Data"] as Map<String, dynamic>;

        dataMap.forEach((key, value) {
          var chartData = <ChartData>[];

          for (var data in value) {
            chartData.add(ChartData(data[header["Column1"]],
                data[header["Column2"]] /*,Colors.indigo*/));
          }
          dashboardSingleBarchartMultiselectModel.chartData
              .addIf(true, key, chartData);
        });

        dashboardChartModelMap.value
            .addIf(true, key, dashboardSingleBarchartMultiselectModel);
      });

      changeView();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    model.value.isLoading = false;
    model.refresh();
    if (kDebugMode) {
      print('load data of $id end at ${DateTime.now()}');
    }
  }

  changeView() {
    if (viewValue.value && viewAll.value) {
      selectedView.value = "ValueAll";
    } else if (viewValue.value && viewHiEnd.value) {
      selectedView.value = "ValueHighEnd";
    } else if (viewVolume.value && viewAll.value) {
      selectedView.value = "VolumeAll";
    } else if (viewVolume.value && viewHiEnd.value) {
      selectedView.value = "VolumeHighEnd";
    }
    try {
      selectedSubView.value =
          dashboardChartModelMap[selectedView.value]!.chartData.keys.first;
      selectedSubViewList.value = dashboardChartModelMap[selectedView.value]!.chartData.keys.toList();
    } catch (e) {}

    selectedSubView.refresh();
    selectedSubViewList.refresh();
    selectedView.refresh();
  }

  changeAllHighEndViews() {
    if (viewAll.value) {
      viewAll.value = false;
      viewHiEnd.value = true;
    } else if (viewHiEnd.value) {
      viewHiEnd.value = false;
      viewAll.value = true;
    }
    changeView();
  }

  changeValueVolumeViews() {
    if (viewValue.value) {
      viewValue.value = false;
      viewVolume.value = true;
    } else if (viewVolume.value) {
      viewVolume.value = false;
      viewValue.value = true;
    }
    changeView();
  }

  changeSelectedSubViews(String? value){
    value?.let((it){
      selectedSubView.value = value;
    });
    selectedSubView.refresh();
  }

  int colourIndex = 256;

  Color getRandomColor() {
    return Color.fromARGB(
      255, // Fully opaque
      random.nextInt(colourIndex++), // Red: 0-255
      random.nextInt(colourIndex++), // Green: 0-255
      random.nextInt(colourIndex++), // Blue: 0-255
    );
  }
}
