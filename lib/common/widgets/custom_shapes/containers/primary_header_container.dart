import 'package:flutter/material.dart';
import 'package:zone_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:zone_store/common/widgets/custom_shapes/curved_edges/curved_edge_widgets.dart';
import 'package:zone_store/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                  backgroundColor: TColors.white.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                  backgroundColor: TColors.white.withOpacity(0.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
