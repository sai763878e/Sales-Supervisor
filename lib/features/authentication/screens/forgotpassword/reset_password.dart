import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/forgotpassword/forgot_password_controller.dart';
import '../login/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(CImages.mailSent),
                width: CHelperFunction.screenWidth() * 0.8,
                height: CHelperFunction.screenHeight() * 0.3,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              Text(
                email,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),


              Text(
                CTexts.resetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              Text(
                CTexts.resetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems * 2,
              ),

              ///
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.off(() =>  LoginScreen()),
                      child: const Text(CTexts.done))),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => ForgotPasswordController.instance.resendPasswordResetEmail(email), child: const Text(CTexts.resendEmail)))
            ],
          ),
        ),
      ),
    );
  }
}
