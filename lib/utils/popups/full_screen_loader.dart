import 'package:face_skin_detection_flutter/common/widgets/loaders/animation_loader.dart';
import 'package:face_skin_detection_flutter/utils/constants/colors.dart';
import 'package:face_skin_detection_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false, // the dialog cant be dismissed
      builder: (_) => PopScope(
        canPop: false, // disabled popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
