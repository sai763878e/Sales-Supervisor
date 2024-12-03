import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class CBrandTitleWithVerificationIcon extends StatelessWidget {
  const CBrandTitleWithVerificationIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = CColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSize.small,
    this.mainAxisSize = MainAxisSize.max,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSize brandTextSize;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: mainAxisSize,
      children: [
        Flexible(
            child: CBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        )),

        const SizedBox(
          width: CSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: CSizes.iconXs,
        ),
      ],
    );
  }
}
