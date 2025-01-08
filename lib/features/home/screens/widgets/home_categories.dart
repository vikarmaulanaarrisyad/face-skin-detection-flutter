import 'package:face_skin_detection_flutter/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Set a fixed height for horizontal scrolling
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.sporticon,
            title: 'Coklat',
            onTap: () {
              // Define onTap functionality here
            },
          );
        },
      ),
    );
  }
}
