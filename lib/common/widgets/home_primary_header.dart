import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/curved_edges/circular_container.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curve_edge_widget.dart';
import '../../../../../utils/constants/colors.dart';

class CHeaderContainer extends StatelessWidget {
  const CHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CCurvedEdgeWidget(
      child: Container(
        color: CColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          // width: 400,
          // height: CHelperFunction.screenHeight() * 0.45,
          child: Stack(
            children: [
              Positioned(
                  top: -180,
                  right: -280,
                  child: CCircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  )),
              Positioned(
                  top: 100,
                  right: -300,
                  child: CCircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  )),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
