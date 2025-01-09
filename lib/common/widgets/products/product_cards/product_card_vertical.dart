import 'package:face_skin_detection_flutter/common/styles/shadows.dart';
import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:face_skin_detection_flutter/common/widgets/images/t_rounded_image.dart';
import 'package:face_skin_detection_flutter/common/widgets/text/product_price_text.dart';
import 'package:face_skin_detection_flutter/common/widgets/text/product_title_text.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    // Container with side padding, color, edges, radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Thubnail
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // Thumbnail image
                  const TRoundedImage(
                    imageUrl: TImages.productBanner1,
                    applyImageRadius: true,
                  ),

                  // Product Details
                  Positioned(
                    bottom: 12, // Memastikan teks berada di bawah gambar
                    left: TSizes.sm, // Memberikan padding kiri
                    right: TSizes.sm, // Memberikan padding kanan
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8), // Memberikan jarak vertikal
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TProductTitleText(
                            title: 'Green Nike Air Shoes',
                            smallSize: true,
                            maxLines: 2,
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),
                          Row(
                            children: [
                              Text(
                                'Nike',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(width: TSizes.xs),
                              const Icon(
                                Iconsax.verify5,
                                color: TColors.primary,
                                size: TSizes.iconXs,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Price
                              const TProductPriceText(
                                price: '35.0',
                              ),

                              // Add to Cart Button
                              Container(
                                decoration: const BoxDecoration(
                                  color: TColors.dark,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(TSizes.cardRadiusMd),
                                    bottomLeft: Radius.circular(
                                        TSizes.productImageRadius),
                                  ),
                                ),
                                child: const SizedBox(
                                  width: TSizes.iconLg * 1.2,
                                  height: TSizes.iconLg * 1.2,
                                  child: Center(
                                    child: Icon(
                                      Iconsax.add,
                                      color: TColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
            // details
          ],
        ),
      ),
    );
  }
}
