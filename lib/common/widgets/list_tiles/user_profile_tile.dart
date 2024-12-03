import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';
import '../loaders/shimmer.dart';

class CProfileheader extends StatelessWidget {
  const CProfileheader({
    super.key,
    required this.onPressed, required this.accountEditKey,
  });

  final VoidCallback onPressed;
  final GlobalKey accountEditKey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Obx(() {
        final networkImage = "".obs;
        final image = networkImage.isNotEmpty
            ? networkImage.value
            : CImages.userIcon;
        return false
            ? CShimmerEffect(
          width: 50,
          height: 50,
          radius: 100,
        )
            : CCircularImage(
          isNetworkImage: networkImage.isNotEmpty,
          imageUrl: image,
          width: 50,
          height: 50,
        );
      }),
      title: Obx(
        () => Text(
          "".obs.value,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: CColors.white),
        ),
      ),
      subtitle: Obx(
        () => Text(
          "".obs.value,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: CColors.white),
        ),
      ),
      trailing: IconButton(
        key: accountEditKey,
        onPressed: onPressed,
        icon: Icon(
          Iconsax.edit,
          color: CColors.white,
        ),
      ),
    );
  }
}
