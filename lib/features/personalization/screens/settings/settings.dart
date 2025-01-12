import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; // Import GetStorage
import 'package:iconsax/iconsax.dart';
import 'package:face_skin_detection_flutter/common/widgets/appbar/appbar.dart';
import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:face_skin_detection_flutter/common/widgets/list_title/setting_menu_title.dart';
import 'package:face_skin_detection_flutter/common/widgets/list_title/user_profile_title.dart';
import 'package:face_skin_detection_flutter/common/widgets/text/section_heading.dart';
import 'package:face_skin_detection_flutter/features/personalization/controllers/profile_controller.dart';
import 'package:face_skin_detection_flutter/features/personalization/screens/profile/profile.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    // Accessing GetStorage to get the name and email
    final box = GetStorage();
    final String name = box.read('NAME');
    final String email = box.read('EMAIL');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // User Profile Card
                  TUserprofileText(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                    title: name, // Display the user's name
                    subTitle: email, // Display the user's email
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Other Settings...
                  const TSettingsMenuTitle(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subTitle: 'Set Address',
                  ),

                  // logout button
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => controller.doLogout(),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
