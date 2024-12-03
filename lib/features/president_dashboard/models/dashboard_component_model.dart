import 'dashboard_report_ids.dart';

class DashboardComponentModel {
  bool isLoading;
  Map<String, dynamic>? response;
  DashboardReportIds type;
  String reportId;
  String reportWindowId;

  DashboardComponentModel(
      {this.isLoading = false,
      this.response,
      required this.type,
       this.reportId="",
       this.reportWindowId=""});
}
