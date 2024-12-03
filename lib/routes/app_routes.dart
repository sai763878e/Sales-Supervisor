
import 'package:sales_supervisor/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';


import 'CRoutes.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: CRoutes.login, page: () => LoginScreen()),
    // GetPage(name: CRoutes.home, page: () => HomeScreen()),
    // GetPage(name: CRoutes.signUp, page: () => SignupScreen()),
    // GetPage(name: CRoutes.verifyEmail, page: () => VerifyEmailScreen()),
    // GetPage(name: CRoutes.forgotPassword, page: () => ForgotPasswordScreen()),
    // GetPage(name: CRoutes.onBoarding, page: () => OnBoardingScreen()),

  ];
}