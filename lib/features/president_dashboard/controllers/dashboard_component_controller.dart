import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:sales_supervisor/data/repositories/remote/authentication/president_dashboard/president_dashboard_repository.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';

class DashboardComponentController extends GetxController {
  PresidentMyDashboardController presidentMyDashboardController;
  Rx<DashboardComponentModel> model;

  DashboardComponentController(
    this.presidentMyDashboardController,
    this.model,
  );

  PresidentDashboardRepository presidentDashboardRepository =
      PresidentDashboardRepository.instance;
  final Random random = Random();
  int? id;

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

      parseSSPLSSPDashboard(model);
    });
  }

  parseSSPLSSPDashboard(Rx<DashboardComponentModel> model) async {
    try {
      var result = model.value.response!;
      var hasFilters = result["HasFilters"];
      var rightViews = result["RightViews"];
      var centerViews = result["CenterViews"];
      var views = result["Views"] as Map<String, dynamic>;

      model.value.chartData = {};

      views.forEach((key, value) {
        var header = value["Header"];
        var defaultData = value["Data"]["default"];

        var chartData = [];
        for (var data in defaultData) {
          chartData.add([
            data[header["Column2"]], //value
            data[header["Column1"]], //label
            getRandomColor(),
          ]);
        }

        model.value.chartData.addIf(true,key,chartData);
      });

      if(model.value.chartData.isNotEmpty){
        model.value.chartData[""];
      }
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
