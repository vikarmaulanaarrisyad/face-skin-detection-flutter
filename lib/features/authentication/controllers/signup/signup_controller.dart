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
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // SignUp
  Future<void> signup() async {
    try {
      // Start Loding
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.decorAnimation);
      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (signupFormKey.currentState!.validate()) return;

      // Check Privacy Police
      if (!privacyPolice.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In continue to create account, yout must have to read and accept the Privacy Policy & Terms of use');
        return;
      }

      // Register user in the database

      // save userdata

      // show success

      // move to very email
    } catch (e) {
      // show some generic
      TLoaders.errorSnackBar(title: 'Erorr!', message: e.toString());
    } finally {
      // remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
