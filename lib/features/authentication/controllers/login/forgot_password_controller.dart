import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/device/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      if (!forgotPasswordFormKey.currentState!.validate()) {
        return;
      }

      CFullScreenLoader.openLoadingDialog(
          "Processing your request...", CImages.processing);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        CFullScreenLoader.stopLoading();
        return;
      }

      // await AuthenticationRepository.instance
      //     .sendPasswordResetEmail(email.text.trim());

      CFullScreenLoader.stopLoading();

      CLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your password'.trim());

      // Get.to(() => ResetPasswordScreen(
      //       email: email.text.trim(),
      //     ));
    } catch (e) {
      //remove loader
      CFullScreenLoader.stopLoading();
      //SHow some generic error to the user
      CLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {

      CFullScreenLoader.openLoadingDialog(
          "Processing your request...", CImages.processing);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        CFullScreenLoader.stopLoading();
        return;
      }

      // await AuthenticationRepository.instance
      //     .sendPasswordResetEmail(email);

      CFullScreenLoader.stopLoading();

      CLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your password'.tr);

    } catch (e) {
      //remove loader
      CFullScreenLoader.stopLoading();
      //SHow some generic error to the user
      CLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
