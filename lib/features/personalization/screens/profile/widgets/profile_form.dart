import 'package:face_skin_detection_flutter/features/personalization/controllers/profile_controller.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/constants/text_strings.dart';
import 'package:face_skin_detection_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProfileForm extends StatelessWidget {
  const TProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Form(
      key: controller.profileFormKey,
      child: Column(
        children: [
          // Username Field
          TextFormField(
            controller: controller.name,
            validator: (value) =>
                TValidator.validateEmptyText('Nama Lengkap', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.name,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          // Email Field
          const SizedBox(height: TSizes.spaceBtwInputFileds),
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),
          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.doUpdateProfile(),
                child: const Text(TTexts.submit)),
          ),
        ],
      ),
    );
  }
}
