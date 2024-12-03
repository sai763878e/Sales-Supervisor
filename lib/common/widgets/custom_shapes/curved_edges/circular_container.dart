
import 'package:flutter/material.dart';

class CCircularContainer extends StatelessWidget {
  const CCircularContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.backgroundColor = Colors.white,
      this.padding = 0,
      this.margin,
      this.child});

  final double? width;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final double padding;
  final Widget? child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
    );
  }
}
