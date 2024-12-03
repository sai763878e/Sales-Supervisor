import 'package:sales_supervisor/features/authentication/controllers/sign_up/sign_up_controller.dart';
import 'package:sales_supervisor/utils/validators/c_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);

    final controller = Get.put(SignUpController());

    return Form(
        key: controller.signUpFormKey,
        child: Column(
          children: [
            ///first & last name
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      CValidation.validateEmptyText(CTexts.firstName, value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: CTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                )),
                const SizedBox(
                  width: CSizes.spaceBtwnInputfields,
                ),
                Expanded(
                    child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      CValidation.validateEmptyText(CTexts.lastName, value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: CTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                )),
              ],
            ),

            const SizedBox(
              height: CSizes.spaceBtwnInputfields,
            ),

            ///username
            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  CValidation.validateEmptyText(CTexts.userName, value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: CTexts.userName,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),

            const SizedBox(
              height: CSizes.spaceBtwnInputfields,
            ),

            ///Email
            TextFormField(
              controller: controller.email,
              validator: (value) => CValidation.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: CTexts.eMail, prefixIcon: Icon(Iconsax.direct)),
            ),

            const SizedBox(
              height: CSizes.spaceBtwnInputfields,
            ),

            ///phoneNumber
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => CValidation.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: CTexts.phoneNumber,
                  prefixIcon: Icon(Iconsax.call)),
            ),

            const SizedBox(
              height: CSizes.spaceBtwnInputfields,
            ),

            ///Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => CValidation.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.password_check,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                    ),
                    labelText: CTexts.password),
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            //terms and Conditions
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: Obx(() => Checkbox(
                        value: controller.privacyPolicy.value,
                        onChanged: (value) => controller.privacyPolicy.value =
                            !controller.privacyPolicy.value))),
                const SizedBox(
                  width: CSizes.spaceBtwnInputfields,
                ),
                Expanded(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: CTexts.iAgree,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: '${CTexts.privacyPolicy}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isDark ? CColors.light : CColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              isDark ? CColors.light : CColors.primary),
                    ),
                    TextSpan(
                      text: ' ${CTexts.and}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: '${CTexts.termsOfUse}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isDark ? CColors.light : CColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              isDark ? CColors.light : CColors.primary),
                    ),
                  ])),
                )
              ],
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            //SignInButton
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.signUp,
                child: const Text(CTexts.createAccount),
              ),
            ),
          ],
        ));
  }
}
