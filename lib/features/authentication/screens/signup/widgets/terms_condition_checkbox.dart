import 'package:face_skin_detection_flutter/features/authentication/controllers/signup/signup_controller.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:face_skin_detection_flutter/utils/constants/text_strings.dart';
import 'package:face_skin_detection_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TTermsConditionCheckbox extends StatelessWidget {
  const TTermsConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 10,
          height: 10,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolice.value,
              onChanged: (value) => controller.privacyPolice.value =
                  !controller.privacyPolice.value,
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.privaryPolice,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                    ),
              ),
              TextSpan(
                text: ' ${TTexts.end} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
