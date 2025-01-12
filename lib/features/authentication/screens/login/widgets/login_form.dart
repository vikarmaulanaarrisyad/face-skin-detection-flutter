import 'package:face_skin_detection_flutter/features/authentication/controllers/login/login_controller.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/signup/signup.dart';
import 'package:face_skin_detection_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:face_skin_detection_flutter/utils/constants/text_strings.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFileds),

          // Password
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
          const SizedBox(height: TSizes.spaceBtwInputFileds / 2),

          // Remember Me & Forgot Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember Me
              Row(
                children: [
                  Obx(() => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value =
                          !controller.rememberMe.value)),
                  const Text(TTexts.rememberMe),
                ],
              ),
              // Forgot Password
              TextButton(
                onPressed: () => Get.to(() => const ForgotPasswordScreen()),
                child: const Text(TTexts.forgotPassword),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // SignIn Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.doLogin(),
              child: const Text(TTexts.signIn),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignUpScreen()),
              child: const Text(TTexts.createAccount),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
