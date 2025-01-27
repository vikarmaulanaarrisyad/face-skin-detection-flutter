import 'package:face_skin_detection_flutter/features/authentication/controllers/signup/signup_controller.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/constants/text_strings.dart';
import 'package:face_skin_detection_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
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

          // Password Field
          const SizedBox(height: TSizes.spaceBtwInputFileds),
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              // validator: (value) => TValidator.validatePassoword(value),
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
                labelText: TTexts.password,
              ),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFileds),
          // TermsConditions
          const TTermsConditionCheckbox(),

          const SizedBox(height: TSizes.spaceBtwSections),
          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () =>
                    controller.doRegister(), // Call the signup logic),
                child: const Text(TTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
