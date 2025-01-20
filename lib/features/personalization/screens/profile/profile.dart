import 'package:face_skin_detection_flutter/common/widgets/appbar/appbar.dart';
import 'package:face_skin_detection_flutter/common/widgets/images/t_circular_image.dart';
import 'package:face_skin_detection_flutter/common/widgets/text/section_heading.dart';
import 'package:face_skin_detection_flutter/features/personalization/controllers/profile_controller.dart';
import 'package:face_skin_detection_flutter/features/personalization/screens/profile/profile_change.dart';
import 'package:face_skin_detection_flutter/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    // Accessing GetStorage to get the name and email
    final box = GetStorage();
    final String name = box.read('NAME');
    final String email = box.read('EMAIL');
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change profile picture'))
                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwSections / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),

              TProfileMenu(
                title: 'Nama Lengkap',
                value: name,
                onPressed: () => Get.to(() => const ProfileChangeScreen()),
              ),

              TProfileMenu(
                title: 'Email',
                value: email,
                onPressed: () => Get.to(() => const ProfileChangeScreen()),
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              const Divider(),

              Center(
                child: TextButton(
                    onPressed: () => controller.doLogout(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
