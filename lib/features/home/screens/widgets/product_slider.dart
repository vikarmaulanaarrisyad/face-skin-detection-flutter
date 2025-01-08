import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_skin_detection_flutter/common/widgets/images/t_rounded_image.dart';
import 'package:face_skin_detection_flutter/features/home/controllers/home_controller.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';
import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductSlider extends StatelessWidget {
  const TProductSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banners
              .map(
                (url) => TRoundedImage(
                  imageUrl: url,
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCirculerContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    // ignore: unrelated_type_equality_checks
                    backgroundColor: controller.carausalCurrentIndex == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
