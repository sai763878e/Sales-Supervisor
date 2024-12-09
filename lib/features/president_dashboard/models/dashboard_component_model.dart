import 'package:flutter/material.dart';

import 'dashboard_report_ids.dart';

class DashboardComponentModel {
  bool isLoading;
  Map<String, dynamic>? response;
  DashboardReportIds type;
  String reportId;
  String reportWindowId;
  Map<String,List> chartData = {};
  static const String valueAll = "ValueAll";
  static const String valueHighEnd = "ValueHighEnd";
  static const String volumeAll = "VolumeAll";
  static const String volumeHighEnd = "VolumeHighEnd";
  // List charData = [
  //   [10, 'Protein', Colors.purple],
  //   [50, 'Carbs', Colors.yellow],
  //   [10, 'Fats', Colors.indigo],
  //   [30, 'Calories', Colors.orange],
  // ];

  DashboardComponentModel(
      {this.isLoading = false,
      this.response,
      required this.type,
       this.reportId="",
       this.reportWindowId=""});
}
