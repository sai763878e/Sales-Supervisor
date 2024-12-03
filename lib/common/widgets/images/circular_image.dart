import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/helpers/helper_functions.dart';
import '../loaders/shimmer.dart';

class CCircularImage extends StatelessWidget {
  const CCircularImage({
    super.key,
    this.fit,
    required this.imageUrl,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = EdgeInsets.zero,
  });

  final BoxFit? fit;
  final String imageUrl;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);

    return Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? (isDark ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    color: overlayColor,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CShimmerEffect(width: 55, height: 55,radius: 55,),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(imageUrl),
                    color: isDark ? Colors.white : Colors.black,
                  ),
          ),
        ));
  }
}
