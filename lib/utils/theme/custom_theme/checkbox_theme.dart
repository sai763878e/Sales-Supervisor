import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CCheckboxTheme {
  CCheckboxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    checkColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return CColors.lightCheckColor_C;
      } else {
        return CColors.lightCheckColor_UC;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return CColors.lightCheckFillColor_C;
      } else {
        return CColors.lightCheckFillColor_UC;
      }
    }),
  );

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    checkColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return CColors.darkCheckColor_C;
      } else {
        return CColors.darkCheckColor_UC;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return CColors.darkCheckFillColor_C;
      } else {
        return CColors.darkCheckFillColor_UC;
      }
    }),
  );
}
