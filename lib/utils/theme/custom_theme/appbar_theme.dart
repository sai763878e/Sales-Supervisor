import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CAppbarTheme {
  CAppbarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: CColors.iconsDark),
    actionsIconTheme: IconThemeData(color: CColors.iconsDark),
    titleTextStyle: TextStyle(
        fontSize: CSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: CColors.iconsDark),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: CColors.iconsDark),
    actionsIconTheme: IconThemeData(color: CColors.iconsLight),
    titleTextStyle: TextStyle(
        fontSize: CSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: CColors.iconsLight),
  );
}
