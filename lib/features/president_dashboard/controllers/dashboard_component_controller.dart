import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/data/repositories/remote/authentication/president_dashboard/president_dashboard_repository.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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
      var views = result["Views"];

      var valueAll = views["ValueAll"];
      var header = valueAll["Header"];
      var data = valueAll["Data"];
      var _default = data["default"] /*as List<Map<String, dynamic>>*/;

      model.value.charData = [];
      for (var value in _default) {
        model.value.charData.add([
          value[header["Column2"]],
          value[header["Column1"]],
          getRandomColor(),
        ]);
        // model.value.charData.assign([
        //   value[header["Column2"]],
        //   value[header["Column1"]],
        //   getRandomColor(),
        // ]);
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
