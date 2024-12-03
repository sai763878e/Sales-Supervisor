import 'package:get_storage/get_storage.dart';
import 'package:sales_supervisor/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:sales_supervisor/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:sales_supervisor/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:sales_supervisor/features/authentication/screens/onboarding/widgets/onboarding_pages.dart';
import 'package:sales_supervisor/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:sales_supervisor/utils/constants/image_strings.dart';
import 'package:sales_supervisor/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../../common/widgets/coach_marks/CoachMarkDesc.dart';

class OnBoardingScreen extends StatelessWidget {
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey skipKey = GlobalKey();
  GlobalKey nextKey = GlobalKey();

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final deviceStorage = GetStorage();

    void initTargets() {
      targets = [
        TargetFocus(
          shape: ShapeLightFocus.Circle,
          identify: "skip-key",
          keyTarget: skipKey,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              builder: (context, controller) {
                return CoachMarkDesc(
                  text: "Click here to skip On Boarding banners.",
                  skip: "Skip",
                  onNext: () {
                    controller.next();
                  },
                  onSkip: () {
                    controller.skip();
                  },
                );
              },
            )
          ],
        ),
        TargetFocus(
          shape: ShapeLightFocus.Circle,
          identify: "next-key",
          keyTarget: nextKey,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) {
                return CoachMarkDesc(
                  text: "Click here to go to next banner.",
                  skip: "Skip",
                  onNext: () {
                    controller.next();
                  },
                  onSkip: () {
                    controller.skip();
                  },
                );
              },
            )
          ],
        ),
      ];
    }

    void showTutorialCoachMarks() {
      initTargets();
      tutorialCoachMark = TutorialCoachMark(targets: targets, hideSkip: true)
        ..show(context: context);
    }

    Future.delayed(Duration(seconds: 1), () {
      showTutorialCoachMarks();
    });

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            //Horizontal Scrollable Pages
            children: [
              OnBoardingPages(
                image: CImages.onBoardingImageNew1,
                title: CTexts.onBoardingTitle1,
                subTitle: CTexts.onBoardingSubTitle1,
              ),
              OnBoardingPages(
                image: CImages.onBoardingImageNew2,
                title: CTexts.onBoardingTitle2,
                subTitle: CTexts.onBoardingSubTitle2,
              ),
              OnBoardingPages(
                image: CImages.onBoardingImageNew3,
                title: CTexts.onBoardingTitle3,
                subTitle: CTexts.onBoardingSubTitle3,
              )
            ],
          ),
          //Skip Buttons
          OnBoardingSkip(
            key: skipKey,
          ),
          //Dot Navigation SmoothPageIndicator
          const OnBoardDotNavigation(),
          OnBoardingNextButton(
            key: nextKey,
          )
        ],
      ),
    );
  }
}
