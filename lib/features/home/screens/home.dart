import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:face_skin_detection_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:face_skin_detection_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:face_skin_detection_flutter/common/widgets/text/section_heading.dart';
import 'package:face_skin_detection_flutter/features/home/screens/widgets/home_appbar.dart';
import 'package:face_skin_detection_flutter/features/home/screens/widgets/home_categories.dart';
import 'package:face_skin_detection_flutter/features/home/screens/widgets/product_slider.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

// Sample Product Data Model
class Product {
  final String title;
  final String imageUrl;
  final String price;
  final String brand;
  final String desc; // Added missing 'desc' field

  Product({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.brand,
    required this.desc, // Add desc to constructor
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of products
    List<Product> products = [
      Product(
        title: 'Baju Warna Coklat Muda',
        imageUrl: TImages.productBanner1,
        price: '35.0',
        brand: 'T-Shirt',
        desc:
            'Perfect match:\n- Kulit Gelap\n- Kulit Sawo Matang', // Corrected multi-line description
      ),
      Product(
        title: 'Red Adidas Sneakers',
        imageUrl: TImages.productBanner2,
        price: '40.0',
        brand: 'Adidas',
        desc: 'Perfect match:\n- Kulit Gelap\n- Kulit Sawo Matang',
      ),
      Product(
        title: 'Blue Puma Running Shoes',
        imageUrl: TImages.productBanner3,
        price: '30.0',
        brand: 'Puma',
        desc: 'Perfect match:\n- Kulit Gelap\n- Kulit Sawo Matang',
      ),
      Product(
        title: 'Black Reebok Sports Shoes',
        imageUrl: TImages.productBanner4,
        price: '50.0',
        brand: 'Reebok',
        desc: 'Perfect match:\n- Kulit Gelap\n- Kulit Sawo Matang',
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Primary Header Section
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // Categories Section
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
                        THomeCategories(
                          titles: ['Coklat', 'Hijau', 'Merah', 'Biru'],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Banner Slider Section
            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TProductSlider(
                banners: [
                  TImages.banner1,
                  TImages.banner2,
                  TImages.banner3,
                  TImages.banner4,
                  TImages.banner5,
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Dynamic Grid Layout for Products
            TGridLayout(
              itemCount: products.length,
              itemBuilder: (_, index) {
                final product = products[index]; // Get the product data
                return TProductCardVertical(
                  title: product.title,
                  imageUrl: product.imageUrl,
                  price: product.price,
                  brand: product.brand,
                  description: product.desc,
                  onTap: () {
                    // Define your onTap functionality here
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
