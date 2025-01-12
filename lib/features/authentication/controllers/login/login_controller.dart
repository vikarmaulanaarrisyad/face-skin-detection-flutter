import 'dart:convert';
import 'package:face_skin_detection_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:face_skin_detection_flutter/utils/constants/image_strings.dart';
import 'package:face_skin_detection_flutter/utils/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:face_skin_detection_flutter/utils/popups/loaders.dart';
import 'package:face_skin_detection_flutter/utils/popups/full_screen_loader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final rememberMe = false.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Base URL for Flask API
  final String _baseUrl = 'https://ec8c-160-22-222-29.ngrok-free.app/api';

  // Login Method
  Future<void> doLogin() async {
    // Start Loading
    TFullScreenLoader.openLoadingDialog(
        'Please wait...', TImages.decorAnimation);

    // Check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TLoaders.errorSnackBar(
          title: 'No Connection', message: 'Check your internet connection.');
      return;
    }

    // Form Validation
    if (!loginFormKey.currentState!.validate()) {
      TLoaders.errorSnackBar(
          title: 'Invalid Form', message: 'Please fill all fields correctly.');
      // Stop loading
      TFullScreenLoader.stopLoading();
      return;
    }

    // HTTP Request
    final url = Uri.parse('$_baseUrl/login');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email.text.trim(),
        'password': password.text.trim(),
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final accessToken = data['data']['access_token']; // Get the access_token
      final name = data['data']['user']['name']; // Get the access_token
      final email = data['data']['user']['email']; // Get the access_token
      final message = data['message'];
      // Save the access token to local storage
      localStorage.write('ACCESS_TOKEN', accessToken);
      localStorage.write('NAME', name);
      localStorage.write('EMAIL', email);

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
