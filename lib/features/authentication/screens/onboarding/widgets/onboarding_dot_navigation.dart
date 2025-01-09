import 'package:face_skin_detection_flutter/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/device/device_utility.dart';
import 'package:face_skin_detection_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? TColors.dark : TColors.light,
              dotHeight: 6),
        ));
  }
}
