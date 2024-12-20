import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/data/repositories/remote/authentication/president_dashboard/president_dashboard_repository.dart';
import 'package:sales_supervisor/features/authentication/models/login/user_pref.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_report_ids.dart';
import 'package:sales_supervisor/features/president_dashboard/models/location_filter_model.dart';

import '../../../data/repositories/remote/api_client/api_service.dart';

class PresidentMyDashboardController extends GetxController {
  static PresidentMyDashboardController get instance => Get.find();
  String userTypeId = "",
      userId = "",
      locationFilterUID = "",
      filterOptionBase = "MTD-LY";
  int filterOptionMonth = 0, filterOptionYear = 0;

  int dashboardComponentInstances = 0;

  PresidentDashboardRepository presidentDashboardRepository =
      PresidentDashboardRepository.instance;

  final dashComponentsList =
      <DashboardReportIds, Rx<DashboardComponentModel>>{};
  final isPageLoading = true.obs;
  final isLocationFilterLoading = true.obs;

  final locationFilterMap = <String, List<FilterDatum>>{}.obs;
  final locationTypesList = <String>[].obs;

  @override
  Future<void> onInit() async {
    if (UserPref.i.getUserData()?.User_Type != null) {
      userTypeId = UserPref.i.getUserData()!.User_Type.toString();
    }
    if (UserPref.i.getUserData()?.User_Id != null) {
      userId = UserPref.i.getUserData()!.User_Id.toString();
    }
    locationFilterUID = "";
    filterOptionBase = "MTD-LY";

    DateTime dateTime = DateTime.now();
    filterOptionMonth = dateTime.month;
    filterOptionYear = dateTime.year;

    initializeDashboard();
    loadLocationFilters();
    super.onInit();
  }

  loadLocationFilters() async {
    isLocationFilterLoading.value = true;

    presidentDashboardRepository
        .getLocationFilters(userId: userId, userTypeId: userTypeId)
        .then((value) {
          if(value.filterData.isNotEmpty){
            for(var location in value.filterData){
              String key = location.type;

              locationFilterMap.value.putIfAbsent(key, ()=>[]).add(location);
              locationTypesList.value = locationFilterMap.value.keys.toList();
            }
          }

          isLocationFilterLoading.value = false;
          isLocationFilterLoading.refresh();
    });
  }

  Future<void> initializeDashboard() async {
    await prepareDashboardData();
    // loadDashboard();
  }

  prepareDashboardData() async {
    for (DashboardReportIds type in DashboardReportIds.values) {
      Rx<DashboardComponentModel> dashboardComponentModel =
          DashboardComponentModel(
        type: type,
      ).obs;

      dashboardComponentModel.value.reportId = type.name.split("_")[0];
      dashboardComponentModel.value.reportWindowId = type.name.split("_")[1];
      dashboardComponentModel.value.isLoading = true;
      dashboardComponentModel.value.response = null;

      // dashComponentsList.assign(type, dashboardComponentModel);
      dashComponentsList.addIf(true, type, dashboardComponentModel);
    }

    isPageLoading.value = false;
    isPageLoading.refresh();
  }
}
