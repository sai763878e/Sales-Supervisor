import 'package:dio/dio.dart';
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

  getDashboardData(
      String userId,
      String userTypeId,
      String reportId,
      String reportWindowId,
      String filterOptionBase,
      String filterOptionYear,
      String filterOptionMonth,
      String locationFilterUID,
      DashboardComponentModel model) async {
    String url =
        'GetData?UserTypeId=$userTypeId&UserId=$userId&ReportId=$reportId&ReportWindowId=$reportWindowId&FilterOptionsBase=$filterOptionBase&FilterOptionsYear=$filterOptionYear&FilterOptionsMonth=$filterOptionMonth&LocationFilterUID=$locationFilterUID';
    try {
      final response = await dio.get(url);
      model.response = response.data;
    } catch (e) {
    } finally {
      model.isLoading = false;
    }
  }
}
