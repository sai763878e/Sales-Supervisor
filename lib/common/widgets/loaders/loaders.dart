import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class CLoader {

  static successSnackBar({required title, message = ''}) {
    Get.snackbar(
        title, message, isDismissible: true,
        shouldIconPulse: true,
        colorText: CColors.white,
        backgroundColor: CColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.check, color: CColors.white,)
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
        title, message, isDismissible: true,
        shouldIconPulse: true,
        colorText: CColors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: CColors.white,)
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
        title, message, isDismissible: true,
        shouldIconPulse: true,
        colorText: CColors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: CColors.white,)
    );
  }
}