import 'package:face_skin_detection_flutter/common/styles/spacing_styles.dart';
import 'package:face_skin_detection_flutter/common/widgets/login_signup/form_divider.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/login/widgets/login_form.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/login/widgets/login_header.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo, title, sub-title
              TLoginHeader(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Form
              const TLoginForm(),
              // Divider
              TFormDivider(dark: dark),
            ],
          ),
        ),
      ),
    );
  }
}
