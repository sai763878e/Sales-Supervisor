import 'package:get/get.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';


class PresidentDashboardController extends GetxController {
  static PresidentDashboardController get instance => Get.find();

  final tabs = [AppLanguageUtils.instance.myDashboard,AppLanguageUtils.instance.myAlerts];



}
