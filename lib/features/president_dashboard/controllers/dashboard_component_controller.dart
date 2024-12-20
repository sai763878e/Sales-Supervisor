import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sales_supervisor/data/repositories/remote/authentication/president_dashboard/president_dashboard_repository.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_view_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_pie_chart_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_report_ids.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class DashboardComponentController extends GetxController {
  DashboardComponentController(this.presidentMyDashboardController,
      this.model,);

  PresidentMyDashboardController presidentMyDashboardController;
  Rx<DashboardComponentModel> model;
  PresidentDashboardRepository presidentDashboardRepository =
      PresidentDashboardRepository.instance;
  final Random random = Random();
  int? id;

  final dashboardChartModelMap = <String, DashboardComponentViewModel>{}.obs;
  final selectedView = "".obs;
  final rightViewsList = <String>[].obs;
  final centerViewsList = <String>[].obs;
  int rightViewSelected = 0;
  int centerViewSelected = 0;

  final selectedSubView = "".obs;
  final selectedSubViewList = <String>[].obs;

  final viewAll = true.obs;
  final viewHiEnd = false.obs;
  final viewValue = true.obs;
  final viewVolume = false.obs;

  @override
  void onInit() {
    loadDashboard();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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
      parseSSPLSSPDashboard(model);
    });
  }

   final pieChartModels = {DashboardReportIds.SSP_LSSP};
   final singleBarChartModels = {
    DashboardReportIds.SSP_CSSP,
    DashboardReportIds.SSP_SSSP
  };
  final dualBarChartModels = {
    DashboardReportIds.SSTA_CSSTA,
    DashboardReportIds.SSTA_SSSTA,
    DashboardReportIds.SPP_LSPP,

  };

  parseSSPLSSPDashboard(Rx<DashboardComponentModel> model) async {
    try {
      var result = model.value.response!;
      var hasFilters = result["HasFilters"];
      var rightViews = result["RightViews"];
      var centerViews = result["CenterViews"];

      rightViewsList.value = [];
      centerViewsList.value = [];
      for (var view in rightViews) {
        rightViewsList.value.add(view);
      }
      for (var view in centerViews) {
        centerViewsList.value.add(view);
      }

      var views = result["Views"] as Map<String, dynamic>;

      views.forEach((key, value) {
        DashboardComponentViewModel dashboardComponentViewModel =
        DashboardComponentViewModel();

        dashboardComponentViewModel.title = value["Title"];
        dashboardComponentViewModel.subTitle = value["Subtitle"];
        dashboardComponentViewModel.key = key;

        var header = value["Header"];
        var dataMap = value["Data"] as Map<String, dynamic>;

        if (pieChartModels.contains(model.value.type)) {
          dataMap.forEach((key, value) {
            var chartData = [];
            for (var data in value) {
              chartData.add([
                data[header["Column1"]], //label
                data[header["Column2"]], //value
                getRandomColor(),
              ]);
            }
            dashboardComponentViewModel.chartData
                .addIf(true, key, chartData);
          });
        } else if (singleBarChartModels.contains(model.value.type)) {
          dataMap.forEach((key, value) {
            var chartData = [];
            for (var data in value) {
              chartData.add([
                data[header["Column1"]], //label
                data[header["Column2"]], //value
                getRandomColor(),
              ]);
            }
            dashboardComponentViewModel.chartData
                .addIf(true, key, chartData);
          });
        }else if (dualBarChartModels.contains(model.value.type)) {
          dataMap.forEach((key, value) {
            var chartData = [];
//do not change sequence index will lead to crashes
            for (var data in value) {
              chartData.add([
                data[header["Column1"]],//label
                data[header["Column2"]],//barone value - taget
                data[header["Column3"]],//barone value - ach
                data[header["Column4"]],//growth
                header["Column2"],//barone label
                header["Column3"],//bartwo label
                Colors.indigo,
                Colors.blueAccent,
              ]);
            }
            dashboardComponentViewModel.chartData
                .addIf(true, key, chartData);
          });
        }


        dashboardChartModelMap.value
            .addIf(true, key, dashboardComponentViewModel);
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
    String view = "";
    if (rightViewsList.value.isNotEmpty) {
      view = getRightView() + getCenterView();
    }

    if (centerViewsList.value.isNotEmpty) {
      view = getRightView() + getCenterView();
    }

    if (view.isNotEmpty) selectedView.value = view;

    try {
      selectedSubView.value =
          dashboardChartModelMap[selectedView.value]!.chartData.keys.first;
      selectedSubViewList.value =
          dashboardChartModelMap[selectedView.value]!.chartData.keys.toList();
    } catch (e) {}

    selectedSubView.refresh();
    selectedSubViewList.refresh();

    selectedView.refresh();
  }

  changeCenterViews() {
    if (centerViewsList.value.isNotEmpty) {
      centerViewSelected = centerViewSelected == 0 ? 1 : 0;
    }
    changeView();
  }

  changeRightViews() {
    if (rightViewsList.value.isNotEmpty) {
      rightViewSelected = rightViewSelected == 0 ? 1 : 0;
    }
    changeView();
  }

  changeSelectedSubViews(String? value) {
    value?.let((it) {
      selectedSubView.value = value;
    });
    selectedSubView.refresh();
  }

  String getCenterView() {
    if (centerViewsList.value.isNotEmpty) {
      return centerViewsList[centerViewSelected].replaceAll(' ', '');
    }

    return "";
  }

  String getRightView() {
    if (rightViewsList.value.isNotEmpty) {
      return rightViewsList[rightViewSelected].replaceAll(' ', '');
    }

    return "";
  }

  String getCenterViewToDisplay() {
    if (centerViewsList.value.isNotEmpty) {
      return 'Switch to ${centerViewsList[centerViewSelected == 0 ? 1 : 0]
          .replaceAll(' ', '')}';
    }

    return "";
  }

  String getRightViewToDisplay() {
    if (rightViewsList.value.isNotEmpty) {
      return 'Switch to ${rightViewsList[rightViewSelected == 0 ? 1 : 0]
          .replaceAll(' ', '')}';
    }

    return "";
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
