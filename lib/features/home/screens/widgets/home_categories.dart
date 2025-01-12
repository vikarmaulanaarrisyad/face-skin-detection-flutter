import 'package:face_skin_detection_flutter/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
    required this.titles, // List of titles passed to this widget
  });

  final List<String> titles; // List of category titles

  // Color map for categories
  static const Map<String, Color> categoryColors = {
    'Coklat': Colors.brown,
    'Hijau': Colors.green,
    'Merah': Colors.red,
    'Biru': Colors.blue,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Set a fixed height for horizontal scrolling
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: titles.length, // Use the length of the list for item count
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image:
                TImages.sporticon, // Image remains constant for each category
            title: titles[index], // Use the title from the list dynamically
            onTap: () {
              // Define onTap functionality here
            },
          );
        },
      ),
    );
  }
}
