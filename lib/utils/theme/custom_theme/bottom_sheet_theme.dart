import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CBottomSheetTheme {
  CBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: CColors.lightContainer,
    modalBackgroundColor: CColors.lightContainer,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(CSizes.md)),
  );


  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: CColors.darkContainer,
    modalBackgroundColor: CColors.darkContainer,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(CSizes.md)),
  );

}
