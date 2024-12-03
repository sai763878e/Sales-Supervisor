

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CChipTheme{
  CChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: CColors.dark),
    selectedColor: CColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: CSizes.xmd,vertical: CSizes.xmd),
    checkmarkColor: Colors.white
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: CColors.light),
      selectedColor: CColors.primary,
      padding: EdgeInsets.symmetric(horizontal: CSizes.xmd,vertical: CSizes.xmd),
      checkmarkColor: Colors.white
  );
}