import 'package:face_skin_detection_flutter/common/widgets/login_signup/form_divider.dart';
import 'package:face_skin_detection_flutter/features/personalization/screens/profile/widgets/profile_form.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/constants/text_strings.dart';
import 'package:face_skin_detection_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProfileChangeScreen extends StatelessWidget {
  const ProfileChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Form
              const TProfileForm(),

              // Divider
              const SizedBox(height: TSizes.spaceBtwSections),
              TFormDivider(dark: dark)
            ],
          ),
        ),
      ),
    );
  }
}
