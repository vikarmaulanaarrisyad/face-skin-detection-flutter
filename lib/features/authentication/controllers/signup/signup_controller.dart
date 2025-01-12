import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:face_skin_detection_flutter/utils/helpers/network_manager.dart';
import 'package:face_skin_detection_flutter/utils/popups/full_screen_loader.dart';
import 'package:face_skin_detection_flutter/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variable
  final hidePassword = true.obs;
  final privacyPolice = false.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // SignUp
  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.decorAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (signupFormKey.currentState!.validate()) return;

      // Check Privacy Policy
      if (!privacyPolice.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'To continue creating an account, you must read and accept the Privacy Policy & Terms of Use');
        return;
      }
    } catch (e) {
      // Handle any generic errors
      TLoaders.errorSnackBar(title: 'Error!', message: e.toString());
    } finally {
      // Remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
