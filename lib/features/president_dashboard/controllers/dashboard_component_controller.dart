import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sales_supervisor/data/repositories/remote/authentication/president_dashboard/president_dashboard_repository.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_my_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_view_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_pie_chart_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_report_ids.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../models/location_filter_model.dart';

class DashboardComponentController extends GetxController {
  DashboardComponentController(
    this.presidentMyDashboardController,
    this.model,
  );

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

  final GlobalKey repaintKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // loadDashboard();
    super.onReady();
  }

  Future<void> loadDashboard() async {
    // model.value.isLoading=true;

    // model.refresh();
    id = random.nextInt(256);
    if (kDebugMode) {
      print('load data of $id start at ${DateTime.now()}');
    }
    presidentDashboardRepository
        .getDashboardData(
            userId: model.value.userId,
            userTypeId: model.value.userTypeId,
            reportId: model.value.reportId,
            reportWindowId: model.value.reportWindowId,
            filterOptionBase: model.value.filterOptionBase,
            filterOptionYear: model.value.filterOptionYear,
            filterOptionMonth: model.value.filterOptionMonth,
            locationFilterUID: model.value.locationFilterUID,
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
            dashboardComponentViewModel.chartData.addIf(true, key, chartData);
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
            dashboardComponentViewModel.chartData.addIf(true, key, chartData);
          });
        } else if (dualBarChartModels.contains(model.value.type)) {
          dataMap.forEach((key, value) {
            var chartData = [];
//do not change sequence index will lead to crashes
            for (var data in value) {
              chartData.add([
                data[header["Column1"]], //label
                data[header["Column2"]], //barone value - taget
                data[header["Column3"]], //barone value - ach
                data[header["Column4"]], //growth
                header["Column2"], //barone label
                header["Column3"], //bartwo label
                Colors.indigo,
                Colors.blueAccent,
              ]);
            }
            dashboardComponentViewModel.chartData.addIf(true, key, chartData);
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
      return 'Switch to ${centerViewsList[centerViewSelected == 0 ? 1 : 0].replaceAll(' ', '')}';
    }

    return "";
  }

  String getRightViewToDisplay() {
    if (rightViewsList.value.isNotEmpty) {
      return 'Switch to ${rightViewsList[rightViewSelected == 0 ? 1 : 0].replaceAll(' ', '')}';
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

  duplicateComponent() async {
    try {
      // presidentMyDashboardController.duplicateComponent(model.value.type,DashboardReportIds.SSTA_TCSSTA);
      presidentMyDashboardController.duplicateComponent(
          model.value, model.value.type);
    } catch (e) {}
    // presidentMyDashboardController.dashComponentsList[model.value.reportWindowId].add()
  }

  filterComponent(BuildContext context, bool isDark,
      DashboardComponentController controller) async {
    try {
      // presidentMyDashboardController.openLocationFilter("");
      presidentMyDashboardController.showLocationFilterSheet(
          context, isDark, model.value.locationFilterMap, false, controller);
    } catch (e) {}
  }

  submitComponentLocationFilter(
      RxMap<String, List<FilterDatum>> locationFilterMap) async {
    try {
      model.value.isLoading = true;
      model.refresh();

      Map<String, dynamic> json = {};
      locationFilterMap.forEach((key, value) {
        List<dynamic> selectedList = [];
        for (var element in value) {
          if (element.isSelected == 1) selectedList.add(element.id);
        }
        json.addIf(true, key, selectedList);
      });

      presidentDashboardRepository
          .postLocationFilters(data1: json)
          .then((value) {
        if (value != null && value.isNotEmpty) {
          model.value.locationFilterUID = value;
        }

        loadDashboard();
      });
    } catch (e) {
    } finally {}
  }

  // Function to capture the widget as an image
  Future<void> captureAndShare() async {
    try {
      // Capture the widget as an image
      RenderRepaintBoundary boundary = repaintKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

      // Convert image to byte data
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData == null) {
        print("Error capturing image.");
        return;
      }

      // Convert ByteData to Uint8List
      Uint8List uint8List = byteData.buffer.asUint8List();

      // Get the temporary directory to save the image
      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/image.png';

      // Save the image to the file system
      File imgFile = File(path)..writeAsBytesSync(uint8List);

      // Share the image file via WhatsApp
      // await Share.shareFiles([path], text: 'Check out this image!', sharePositionOrigin: Rect.fromLTWH(0, 0, 1, 1));

      // Share the image file via WhatsApp
      final result = await Share.shareXFiles([XFile(path)],
          text: dashboardChartModelMap[selectedView.value]!.title);

      if (result.status == ShareResultStatus.success) {
        print('Thank you for sharing the picture!');
      }
    } catch (e) {
      print("Error sharing image: $e");
    }
  }
}
