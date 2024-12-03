import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/common/widgets/home_primary_header.dart';
import 'package:sales_supervisor/utils/constants/prefernece_constants.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';
import 'package:sales_supervisor/utils/local_storage/storage_utility.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../common/widgets/coach_marks/CoachMarkDesc.dart';
import '../../../common/widgets/list_tiles/setting_menu_tile.dart';
import '../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../language/screens/change_language_screen.dart';

class ProfileScreen extends StatelessWidget {
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey changeLanguageKey = GlobalKey();
  GlobalKey accountEditKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);

    void initTargets() {
      targets = [
        TargetFocus(shape: ShapeLightFocus.Circle,
          identify: "account-edit-key",
          keyTarget: accountEditKey,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              builder: (context, controller) {
                return CoachMarkDesc(
                  text:
                  "You can edit or view your account information here.",
                  skip: "Skip",
                  onNext: () {controller.next();},
                  onSkip: () {controller.skip();},
                );
              },
            )
          ],
        ),

        TargetFocus(shape: ShapeLightFocus.RRect,
          identify: "change-language-key",
          keyTarget: changeLanguageKey,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              builder: (context, controller) {
                return CoachMarkDesc(
                  text:
                      "You can change your preferable app language from here.",
                  skip: "Skip",
                  onNext: () {controller.next();},
                  onSkip: () {controller.skip();},
                );
              },
            )
          ],
        ),

      ];
    }

    void showTutorialCoachMarks() {
      initTargets();
      tutorialCoachMark = TutorialCoachMark(targets: targets,hideSkip: true)
        ..show(context: context);
      CLocalStorage().saveData(PreferenceConstants.isProfileTourDone, true);
    }

    Future.delayed(Duration(seconds: 1), () {
      CLocalStorage().readData(PreferenceConstants.isProfileTourDone) != true
          ? showTutorialCoachMarks()
          : (){};
      ;
    });

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          CHeaderContainer(
              child: Column(
            children: [
              CAppBar(
                title: Text(
                  AppLanguageUtils.instance.account,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: CColors.white),
                ),
              ),

              ///UserProfile
              CProfileheader(
                onPressed: () {},
                accountEditKey: accountEditKey,
              ),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
            child: Column(
              children: [
                CSectionHeading(
                  title: AppLanguageUtils.instance.accountSettings,
                  buttonTitle: AppLanguageUtils.instance.viewAll,
                  onPressed: () {},
                  titleColor: isDark ? CColors.white : Colors.black,
                ),
                // const SizedBox(height: CSizes.spaceBtwItems,),

                CSettingMenuTile(
                    key: changeLanguageKey,
                    onTap: () => Get.to(() => ChangeLanguageScreen()),
                    icon: Iconsax.language_circle,
                    title: AppLanguageUtils.instance.changeLanguage,
                    subTitle: AppLanguageUtils.instance.changeLanguageNote),

                CSettingMenuTile(
                    // onTap: () => Get.to(() => const AddressesScreen()),
                    icon: Iconsax.safe_home,
                    title: AppLanguageUtils.instance.myAddress,
                    subTitle: AppLanguageUtils.instance.myAddressSubNote),

                CSettingMenuTile(
                    icon: Iconsax.notification,
                    title: AppLanguageUtils.instance.notifications,
                    subTitle: AppLanguageUtils.instance.notificationsNote),
                CSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: AppLanguageUtils.instance.accountPrivacy,
                    subTitle: AppLanguageUtils.instance.accountPrivacyNote),

                const SizedBox(
                  height: CSizes.spaceBtwSections,
                ),

                CSectionHeading(
                  title: AppLanguageUtils.instance.appSettings,
                  buttonTitle: AppLanguageUtils.instance.viewAll,
                  onPressed: () {},
                  titleColor: isDark ? CColors.white : Colors.black,
                ),
                // const SizedBox(height: CSizes.spaceBtwItems,),

                CSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: AppLanguageUtils.instance.loadData,
                    subTitle: AppLanguageUtils.instance.loadDataNote),

                CSettingMenuTile(
                  icon: Iconsax.location,
                  title: AppLanguageUtils.instance.geoLocations,
                  subTitle: AppLanguageUtils.instance.geoLocationsNote,
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),

                CSettingMenuTile(
                  icon: Iconsax.security_user,
                  title: AppLanguageUtils.instance.safeMode,
                  subTitle: AppLanguageUtils.instance.safeModeNote,
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),

                CSettingMenuTile(
                  icon: Iconsax.image,
                  title: AppLanguageUtils.instance.hdImageQuality,
                  subTitle: AppLanguageUtils.instance.hdImageQuality,
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),

                // Center(
                //   child: TextButton(
                //     onPressed: () => AuthenticationRepository.instance.logOut(),
                //     child: Text(
                //       CTexts.logOut,
                //       style: Theme.of(context)
                //           .textTheme
                //           .labelMedium!
                //           .apply(color: Colors.red),
                //     ),
                //   ),
                // )
              ],
            ),
          )
        ],
      )),
    );
  }
}

