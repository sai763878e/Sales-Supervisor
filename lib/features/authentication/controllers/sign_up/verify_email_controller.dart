
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }


  ///send Email Verification link
  void sendEmailVerification() async {
    try {
      // await AuthenticationRepository.instance.sendEmailVerification();
      CLoader.successSnackBar(
          title: "Email Sent",
          message: "Please check your inbox and verify your email.");
    } catch (e) {
      CLoader.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }
  ///Timer to automatically redirect to email verification
  void setTimerForAutoRedirect() async{
    // Timer.periodic(const Duration(seconds: 1), (timer){
    //   FirebaseAuth.instance.currentUser?.reload();
    //   final user = FirebaseAuth.instance.currentUser;
    //   if(user?.emailVerified ?? false){
    //     timer.cancel();
    //     Get.off(() => SuccessScreen(image: CImages.success_1, title: "Email Verified", subtitle: "Your Email has successfully verified.", onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    //   }
    // });
  }

  ///manually check if email verified

checkEmailVerificationStatus() async{
    // final currentUser = FirebaseAuth.instance.currentUser;
    //
    // if(currentUser != null && currentUser.emailVerified){
    //   Get.off(() => SuccessScreen(image: CImages.success_1, title: "Email Verified", subtitle: "Your Email has successfully verified.", onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    // }
  }
}
