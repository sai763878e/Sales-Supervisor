import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class OnBoardingPages extends StatelessWidget {
  OnBoardingPages(
      {super.key,
        required this.title,
        required this.subTitle,
        required this.image});

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Column(

        children: [
          Lottie.asset(image,
          width: CHelperFunction.screenWidth() * 0.8,
              height: CHelperFunction.screenHeight() * 0.65),
          // Image(
          //     fit: BoxFit.fill,
          //     width: CHelperFunction.screenWidth() * 0.8,
          //     height: CHelperFunction.screenHeight() * 0.65,
          //     image: AssetImage(image)),
          Text(
            textAlign: TextAlign.center,
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,

            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
