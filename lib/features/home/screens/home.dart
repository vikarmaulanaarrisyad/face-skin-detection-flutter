import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:face_skin_detection_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:face_skin_detection_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
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

                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            // Body
            const Padding(
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
            const SizedBox(height: TSizes.spaceBtwItems),

            TGridLayout(
              itemCount: 4,
              itemBuilder: (_, index) => const TProductCardVertical(),
            ),
            const TProductCardVertical(),
          ],
        ),
      ),
    );
  }
}
