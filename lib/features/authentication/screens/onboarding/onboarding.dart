import 'package:face_skin_detection_flutter/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:flutter/material.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:face_skin_detection_flutter/utils/constants/text_strings.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          // Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
