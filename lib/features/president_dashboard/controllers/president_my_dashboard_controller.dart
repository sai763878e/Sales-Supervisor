import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/data/repositories/remote/authentication/president_dashboard/president_dashboard_repository.dart';
import 'package:sales_supervisor/features/authentication/models/login/user_pref.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_report_ids.dart';

import '../../../data/repositories/remote/api_client/api_service.dart';

class PresidentMyDashboardController extends GetxController {
  static PresidentMyDashboardController get instance => Get.find();
  String userTypeId = "",
      userId = "",
      locationFilterUID = "",
      filterOptionBase = "MTD-LY";
  int filterOptionMonth = 0,
      filterOptionYear = 0;

  PresidentDashboardRepository presidentDashboardRepository =
      PresidentDashboardRepository.instance;

  final dashComponentsList = <String, DashboardComponentModel>{};

  @override
  void onInit() {
    super.onInit();
    initializeDashboard();
  }

  Future<void> initializeDashboard() async {
    if (UserPref.i
        .getUserData()
        ?.User_Type != null) {
      userTypeId = UserPref.i.getUserData()!.User_Type.toString();
    }
    if (UserPref.i
        .getUserData()
        ?.User_Id != null) {
      userId = UserPref.i.getUserData()!.User_Id.toString();
    }
    locationFilterUID = "";
    filterOptionBase = "MTD-LY";

    DateTime dateTime = DateTime.now();
    filterOptionMonth = dateTime.month;
    filterOptionYear = dateTime.year;

    await prepareDashboardData();
    // loadDashboard();
  }

  prepareDashboardData() async {
    for (DashboardReportIds type in DashboardReportIds.values) {
      DashboardComponentModel dashboardComponentModel =
      DashboardComponentModel(type: type,);

      dashboardComponentModel.reportId = type.name.split("_")[0];
      dashboardComponentModel.reportWindowId = type.name.split("_")[1];
      dashboardComponentModel.isLoading = true;
      dashboardComponentModel.response = null;

      dashComponentsList.assign(type.name, dashboardComponentModel);
    }
  }

  Future<void> loadDashboard() async {
    dashComponentsList.forEach((key, value) {
      presidentDashboardRepository.getDashboardData(
          userId,
          userTypeId,
          value.reportId,
          value.reportWindowId,
          filterOptionBase,
          '$filterOptionYear',
          '$filterOptionMonth',
          locationFilterUID,
          value);
    });
  }
}
