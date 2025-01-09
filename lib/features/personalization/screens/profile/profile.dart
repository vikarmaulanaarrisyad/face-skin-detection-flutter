import 'package:face_skin_detection_flutter/common/widgets/appbar/appbar.dart';
import 'package:face_skin_detection_flutter/common/widgets/images/t_circular_image.dart';
import 'package:face_skin_detection_flutter/common/widgets/text/section_heading.dart';
import 'package:face_skin_detection_flutter/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                title: 'Name',
                value: 'Admin',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Username',
                value: 'admin@gmail.com',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // HEADING PERSONAL INFO
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                title: 'User ID',
                value: '123',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'E-mail',
                value: 'email',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: '0878',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Laki-laki',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date Of Birth',
                value: '15 Juli 2001',
                onPressed: () {},
              ),

              const Divider(),

              Center(
                child: TextButton(
                    onPressed: () {},
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
