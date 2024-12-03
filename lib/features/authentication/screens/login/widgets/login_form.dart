import 'package:sales_supervisor/features/authentication/screens/forgotpassword/forgot_password.dart';
import 'package:sales_supervisor/features/authentication/screens/signup/signup.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';
import 'package:sales_supervisor/utils/validators/c_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controllerLogin = Get.put(LoginController());
    return Form(
        key: controllerLogin.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
          child: Column(
            children: [
              ///Email
              TextFormField(
                controller: controllerLogin.userName,
                validator: (value) => CValidation.validateEmptyText(AppLanguageUtils.instance.userName,value),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.direct_right,
                    ),
                    labelText: AppLanguageUtils.instance.userName),
              ),
              const SizedBox(
                height: CSizes.spaceBtwnInputfields,
              ),

              ///Password
              Obx(
                () => TextFormField(
                  controller: controllerLogin.password,
                  validator: (value) => CValidation.validateEmptyText(AppLanguageUtils.instance.password,value),
                  obscureText: controllerLogin.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.password_check,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(controllerLogin.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                        onPressed: () => controllerLogin.hidePassword.value =
                            !controllerLogin.hidePassword.value,
                      ),
                      labelText: AppLanguageUtils.instance.password),
                ),
              ),
              const SizedBox(
                height: CSizes.spaceBtwnInputfields / 2,
              ),

              ///Remember me & Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controllerLogin.rememberPassword.value,
                            onChanged: (value) =>
                                controllerLogin.rememberPassword.value =
                                    !controllerLogin.rememberPassword.value),
                      ),
                       Text(AppLanguageUtils.instance.rememberMe),
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.to(const ForgotPasswordScreen()),
                      child:  Text(AppLanguageUtils.instance.forgotPassword)),
                ],
              ),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              ///signIn Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controllerLogin.loginWithUserNameAndPassword(),
                      child: Text(AppLanguageUtils.instance.signIn))),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(SignupScreen()),
                      child:  Text(AppLanguageUtils.instance.createAccount))),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),
            ],
          ),
        ));
  }
}
