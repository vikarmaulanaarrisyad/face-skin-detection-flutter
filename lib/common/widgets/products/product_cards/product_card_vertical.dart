import 'package:face_skin_detection_flutter/common/styles/shadows.dart';
import 'package:face_skin_detection_flutter/common/widgets/images/t_rounded_image.dart';
import 'package:face_skin_detection_flutter/common/widgets/text/product_title_text.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final String brand;
  final String description; // Add a description parameter
  final VoidCallback onTap;

  const TProductCardVertical({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.brand,
    required this.description, // Include description in the constructor
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Thumbnail Image
            TRoundedImage(
              imageUrl: imageUrl,
              applyImageRadius: true,
            ),
            // Title and Product Details below the image
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: title,
                    smallSize: true,
                    maxLines: 2,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        brand,
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
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  // Description below the brand name
                  Text(
                    description,
                    maxLines: 3, // Limit the description to 3 lines
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: dark ? TColors.white : TColors.black,
                          fontSize: TSizes.sm,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
