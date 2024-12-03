import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login_screen.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///Variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///Update Current Index when Page Scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  /// dotNavigationClick
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// nextPage
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage  = GetStorage();

      storage.write("IsFirstTime", false);

      if(kDebugMode){
        print('============GET STORAGE ============');
        print(storage.read("IsFirstTime"));
      }
      Get.offAll(() => LoginScreen());
    } else {
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  /// skipPage
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
