import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sales_supervisor/features/navigation/navigation_menu.dart';
import 'package:sales_supervisor/utils/constants/prefernece_constants.dart';

import '../../../features/authentication/screens/login/login_screen.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    //Local Storage
    deviceStorage.writeIfNull("IsFirstTime", true);
    if (kDebugMode) {
      print('============GET STORAGE ============');
      print(deviceStorage.read("IsFirstTime"));
    }
    deviceStorage.read("IsFirstTime") != true
        ? Get.offAll(() => deviceStorage.read(PreferenceConstants.userMaster) == null ? LoginScreen() : NavigationMenu())
        // ? Get.offAll(() =>  LoginScreen())
        : Get.offAll(() =>  OnBoardingScreen());

    // Get.offAll(() =>  OnBoardingScreen());
  }

/*--------------------------------- Email & Password Sign In ---------------------------------*/
}
