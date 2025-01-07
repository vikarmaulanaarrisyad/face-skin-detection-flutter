import 'package:face_skin_detection_flutter/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/device/device_utility.dart';
import 'package:face_skin_detection_flutter/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? TColors.primary : Colors.black),
            onPressed: () => OnboardingController.instance.nextPage(),
            child: const Icon(Iconsax.arrow_right_3)));
  }
}
