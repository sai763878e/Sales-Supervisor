
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/curved_edges/circular_container.dart';

class CChoiceChip extends StatelessWidget {
  const CChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final colour = CHelperFunction.getColor(text);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: colour != null ? Text('') : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? CColors.white : null),
        avatar: colour != null
            ? CCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: colour,
              )
            : null,
        shape: colour != null ? CircleBorder() : null,
        labelPadding: colour != null ? EdgeInsets.all(0) : null,
        padding: colour != null ? EdgeInsets.all(0) : null,
        // selectedColor: Colors.green,
        backgroundColor: colour != null ? Colors.green : null,
      ),
    );
  }
}
