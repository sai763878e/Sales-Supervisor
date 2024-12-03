import 'package:sales_supervisor/common/widgets/login_signup/form_divider.dart';
import 'package:sales_supervisor/common/widgets/login_signup/social_buttons.dart';
import 'package:sales_supervisor/features/authentication/screens/signup/widgets/sign_up_form.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:sales_supervisor/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Header
              Text(
                CTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              ///Form
              const SignUpForm(),


              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              const CFormDivider(dividerText: CTexts.orSignUp),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              const CSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
