import 'package:flutter/material.dart';

class CColors {
  CColors._();

  static const Color appColor = Color(0xFF4b68ff);

  //App Basic Colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  //Gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);

  //Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color text_light = Colors.white;
  static const Color text_dark = Colors.black;

  //Icons theme colors
  static const Color iconsLight = Colors.white;
  static const Color iconsDark = Colors.black;

  //checkbox colors
  static const Color lightCheckColor_C = Colors.white;
  static const Color lightCheckColor_UC = Colors.black;
  static const Color darkCheckColor_C = Colors.white;
  static const Color darkCheckColor_UC = Colors.black;
  static const Color lightCheckFillColor_C = Colors.blue;
  static const Color lightCheckFillColor_UC = Colors.transparent;
  static const Color darkCheckFillColor_C = Colors.blue;
  static const Color darkCheckFillColor_UC = Colors.transparent;

  //Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Colors.black;
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  //Buttons Colors
  static const Color buttonPrimary = Color(0xFF4b69ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  //Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  //Errors and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57c00);
  static const Color info = Color(0xFF1976D2);

  //neutral shades
  static const Color black = Color(0xFF232323);
  static const Color white = Colors.white;
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
}
