
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/curved_edges/circular_container.dart';

class CChoiceChip extends StatelessWidget {
  const CChoiceChip(
      {super.key, required this.label, required this.selected, this.onSelected});

  final Widget label;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);
    final colour = isDark ? CColors.darkContainer : CColors.lightContainer;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: label,
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? CColors.white : null),
        // avatar:  CCircularContainer(
        //         // width: 50,
        //         // height: 50,
        //         backgroundColor: colour,
        //       )
        //     ,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: isDark ? CColors.grey.withValues(alpha: 0.4): CColors.white.withValues(alpha: 0.4)),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        // labelPadding:EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        // selectedColor: Colors.green,
        backgroundColor:colour,
      ),
    );
  }
}
