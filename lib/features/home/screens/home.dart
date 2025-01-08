import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:face_skin_detection_flutter/common/widgets/text/section_heading.dart';
import 'package:face_skin_detection_flutter/features/home/screens/widgets/home_appbar.dart';
import 'package:face_skin_detection_flutter/features/home/screens/widgets/home_categories.dart';
import 'package:face_skin_detection_flutter/features/home/screens/widgets/product_slider.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSearchContainer(text: 'Search...'),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // Category Warna Kulit
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: 'Populer Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TProductSlider(
                banners: [
                  TImages.productBanner1,
                  TImages.productBanner2,
                  TImages.productBanner3,
                  TImages.productBanner4,
                  TImages.productBanner5,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
