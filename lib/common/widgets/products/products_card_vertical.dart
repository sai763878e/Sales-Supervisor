import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/shadows.dart';
import '../custom_shapes/containers/circular_container.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/rounded_images.dart';
import '../texts/brand_title_with_verification_icon.dart';
import '../texts/product_price_text.dart';
import '../texts/product_title_text.dart';

class CProductCardVertical extends StatelessWidget {
  const CProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);
    return GestureDetector(
      child: Container(
        width: 180,
        // padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
              color: isDark ? CColors.grey.withOpacity(0.5) : CColors.white),
          borderRadius: BorderRadius.circular(CSizes.productImageRadius),
          boxShadow: [CShadowStyle.verticalProductsShadow],
          color: isDark ? CColors.black : CColors.white,
        ),
        child: Column(
          children: [
            CRoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(2),
                backgroundColor: isDark ? CColors.black : CColors.white,
                child: Stack(children: [
                  const CRoundImagePromotion(
                    imageUrl: CImages.facebookLogo,
                    fit: BoxFit.cover,
                    height: 180,
                  ),

                  ///sale Tag
                  Positioned(
                    top: 6,
                    left: 6,
                    child: CRoundedContainer(
                      radius: CSizes.sm,
                      padding: const EdgeInsets.symmetric(
                          horizontal: CSizes.sm, vertical: CSizes.xs),
                      backgroundColor: CColors.secondary.withOpacity(0.8),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: CColors.black),
                      ),
                    ),
                  ),

                  ///Favorites
                  Positioned(
                      top: -3,
                      right: -3,
                      child: CCircularIcon(
                        size: CSizes.lg,
                        // width: CSizes.lg,
                        // height: CSizes.lg,
                        icon: Iconsax.heart,
                        color: Colors.red,
                      )),
                ])),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: CSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CProductTitleText(
                    title: 'Nike Jorden',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: CSizes.spaceBtwItems / 2,
                  ),
                  CBrandTitleWithVerificationIcon(title: 'Nike',),
                ],
              ),
            ),

            const Spacer(),

            // const SizedBox(
            //   width: CSizes.spaceBtwItems,
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: CSizes.sm),
                  child: CProductPriceText(
                    price: "35",
                    // isLarge: false,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: CColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(CSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(CSizes.productImageRadius)),
                  ),
                  child: const SizedBox(
                    width: CSizes.iconLg * 1.2,
                    height: CSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: CColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

