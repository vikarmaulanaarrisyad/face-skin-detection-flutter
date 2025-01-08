import 'package:flutter/material.dart';
import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidgets(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 300,
          // width: 500,
          child: Stack(
            children: [
              // Backgroudn Custom
              Positioned(
                top: -150,
                right: -250,
                child: TCirculerContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCirculerContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),

              child
            ],
          ),
        ),
      ),
    );
  }
}
