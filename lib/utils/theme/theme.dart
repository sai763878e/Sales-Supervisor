import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: CTextTheme.lightTextTheme,
      elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
      chipTheme: CChipTheme.lightChipTheme,
      checkboxTheme: CCheckboxTheme.lightCheckBoxTheme,
      inputDecorationTheme: CTextFieldTheme.lightInputDecorationTheme,
      appBarTheme: CAppbarTheme.lightAppBarTheme,
      bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CTextTheme.dartTextTheme,
      elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
      chipTheme: CChipTheme.darkChipTheme,
      checkboxTheme: CCheckboxTheme.darkCheckBoxTheme,
      inputDecorationTheme: CTextFieldTheme.darkInputDecorationTheme,
      appBarTheme: CAppbarTheme.darkAppBarTheme,
      bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme);
}
