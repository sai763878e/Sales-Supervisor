import 'package:flutter/material.dart';

class CSectionHeading extends StatelessWidget {
  const CSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = '',
    this.onPressed,
    this.titleColor = Colors.black,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  final String title;
  final Color titleColor;
  final String buttonTitle;
  final VoidCallback? onPressed;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: titleColor,/*fontWeightDelta: 1*/),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        TextButton(onPressed: onPressed ?? () {}, child: Text(buttonTitle)),
      ],
    );
  }
}
