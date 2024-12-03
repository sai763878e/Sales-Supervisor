import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class CGridLayout extends StatelessWidget {
  const CGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisEvent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisEvent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: CSizes.gridViewSpacingSm,
            crossAxisSpacing: CSizes.gridViewSpacingSm,
            mainAxisExtent: mainAxisEvent),
        itemBuilder: itemBuilder,
    );
  }
}
