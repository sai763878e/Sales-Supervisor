import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/utils/constants/prefernece_constants.dart';

import '../local_storage/storage_utility.dart';

class AppLanguageUtils {
  static AppLocalizations? _appLocalization;

  static AppLocalizations get instance =>
      /*_appLocalization ??=*/ AppLocalizations.of(Get.context!)!;

  static setAppLocalization(String code) async {
    await Get.updateLocale(Locale(code));
    await CLocalStorage()
        .saveData(PreferenceConstants.selectedLanguageCode, code);
    // _appLocalization = AppLocalizations.of(Get.context!)!;
  }

  static String getPreferenceLanguage() {
    String code =
        CLocalStorage().readData(PreferenceConstants.selectedLanguageCode)
            ?? "en";
    CLocalStorage()
        .saveData(PreferenceConstants.selectedLanguageCode, code);
    return code;
  }
}
