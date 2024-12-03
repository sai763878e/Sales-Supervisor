import 'package:flutter/material.dart';

class ProductsAutoScrollWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List images;

  const ProductsAutoScrollWidget(
      {super.key, required this.scrollController, required this.images});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 120,
        child: ListView.builder(
            controller: scrollController,
            itemCount: images.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(images[index],width: 150,fit: BoxFit.cover,),
            ),
          );
        }),
      ),
    );
  }
}
