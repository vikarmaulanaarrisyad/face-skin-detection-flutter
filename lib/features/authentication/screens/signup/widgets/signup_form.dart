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
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFileds),
              // LastName Field
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText('Last name', value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFileds),

          // Username Field
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
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

          // Phone Number Field
          const SizedBox(height: TSizes.spaceBtwInputFileds),
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          // Password Field
          const SizedBox(height: TSizes.spaceBtwInputFileds),
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassoword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
                prefixIcon: const Icon(Iconsax.password_check),
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
                onPressed: () => controller.signup(), // Call the signup logic),
                child: const Text(TTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
