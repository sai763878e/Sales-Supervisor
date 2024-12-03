import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';


class LanguageListTile extends StatelessWidget {
  const LanguageListTile({super.key, this.isSelected = false, required this.languageName});

  final bool isSelected;
  final String languageName;

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(CSizes.sm),
      child: CRoundedContainer(
        width: double.infinity,
        showBorder: true,
        borderColor: isDark ? Colors.grey.shade300 : CColors.grey,
        backgroundColor:
            isSelected ? CColors.primary.withOpacity(0.2) : CColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CSizes.lg, vertical: CSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    languageName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(fontWeightDelta: 1),
                  ),
                  Container(
                    child: isSelected
                        ? Icon(
                            Iconsax.tick_circle5,
                            color: isDark ? CColors.white : Colors.black,
                          )
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
