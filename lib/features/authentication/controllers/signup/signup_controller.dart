import 'dart:convert';

import 'package:face_skin_detection_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:face_skin_detection_flutter/utils/helpers/network_manager.dart';
import 'package:face_skin_detection_flutter/utils/popups/full_screen_loader.dart';
import 'package:face_skin_detection_flutter/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variable
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final privacyPolice = false.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Base URL for Flask API
  final String _baseUrl = 'https://25ae-103-47-133-85.ngrok-free.app/api';

  Future<void> doRegister() async {
    // Start Loading
    TFullScreenLoader.openLoadingDialog(
        'We are processing your information...', TImages.decorAnimation);

    // Check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;

    // Form Validation
    if (!signupFormKey.currentState!.validate()) {
      TLoaders.errorSnackBar(
          title: 'Invalid Form', message: 'Please fill all fields correctly.');
      // Stop loading
      TFullScreenLoader.stopLoading();
      return;
    }

    // Check Privacy Policy
    if (!privacyPolice.value) {
      TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'To continue creating an account, you must read and accept the Privacy Policy & Terms of Use');
      // Stop loading
      TFullScreenLoader.stopLoading();
      return;
    }

    // HTTP Request
    final url = Uri.parse('$_baseUrl/register');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name.text.trim(),
        'email': email.text.trim(),
        'password': password.text.trim(),
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final message = data['message'];

      // Success feedback
      TLoaders.successSnackBar(title: 'Berhasil', message: message);

      // Stop loading
      TFullScreenLoader.stopLoading();

      // Redirect to NavigationMenu
      AuthenticationRepository.instance.screenRedirect();
    } else {
      final error = jsonDecode(response.body);
      final message = error['message'];
      TLoaders.errorSnackBar(title: 'Gagal', message: message);

      // Stop loading
      TFullScreenLoader.stopLoading();
    }
  }
}
