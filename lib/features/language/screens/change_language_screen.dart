import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/common/widgets/home_primary_header.dart';
import 'package:sales_supervisor/features/language/models/language.dart';
import 'package:sales_supervisor/features/language/screens/language_list_tile.dart';

import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/language/app_language_utils.dart';
import '../../authentication/controllers/language/change_language_controller.dart';

class ChangeLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeLanguageController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CHeaderContainer(
                child: Column(
              children: [
                CAppBar(
                  title: Text(
                    AppLanguageUtils.instance.changeLanguage,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: CColors.white),
                  ),
                ),
                const SizedBox(
                  height: CSizes.spaceBtwSections,
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.all(CSizes.md),
              child: Text(
                textAlign: TextAlign.start,
                AppLanguageUtils.instance.selectLanguageTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Obx(
              () => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  //   physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.languageList.value.length,
                  itemBuilder: (_, index) {
                    Language language = controller.languageList.value[index];
                    return GestureDetector(
                      onTap: () async {
                        await controller.changeLanguageSelection(controller.languageList,index);
                      },
                      child: LanguageListTile(
                        languageName: language.name,
                        isSelected: language.isSelected,
                      ),
                    );
                  }),
            ),
            // LanguageListTile(),
            // LanguageListTile(
            //   isSelected: true,
            // )
          ],
        ),
      ),
    );
  }
}
