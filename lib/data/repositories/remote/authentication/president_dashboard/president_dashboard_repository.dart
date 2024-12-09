import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/data/repositories/remote/api_client/api_service.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';

class PresidentDashboardRepository {
  Dio dio = ApiService.instancePresident;

  static PresidentDashboardRepository? _instance;

  static get instance {
    _instance ??= PresidentDashboardRepository();
    return _instance;
  }

  get_PHOD_LPHOD_Dashboard() async {
    try {
      String url =
          "GetData?UserTypeId=1&UserId=4&ReportId=PHOD&ReportWindowId=LPHOD&FilterOptionsBase=MTD-LY&FilterOptionsYear=2024&FilterOptionsMonth=12&LocationFilterUID=";
      final response = await dio.get(url);
    } catch (e) {}
  }

  Future<void> getDashboardData(
      {required String userId,
      required String userTypeId,
      required String reportId,
      required String reportWindowId,
      required String filterOptionBase,
      required String filterOptionYear,
      required String filterOptionMonth,
      required String locationFilterUID,
      required Rx<DashboardComponentModel> model}) async {
    String url =
        'GetData?UserTypeId=$userTypeId&UserId=$userId&ReportId=$reportId&ReportWindowId=$reportWindowId&FilterOptionsBase=$filterOptionBase&FilterOptionsYear=$filterOptionYear&FilterOptionsMonth=$filterOptionMonth&LocationFilterUID=$locationFilterUID';
    try {
      final response = await dio.get(url);
      model.value.response = response.data;
      if (kDebugMode) {
        print(url);
        print(response);
      }
    } catch (e) {
    } finally {
      // model.value.isLoading = false;
    }
  }
}
