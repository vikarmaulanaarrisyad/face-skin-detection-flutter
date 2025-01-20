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

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final storage = GetStorage();
  final name = TextEditingController();
  final email = TextEditingController();
  int? id; // Tambahkan variabel ID
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  final String _baseUrl = 'https://25ae-103-47-133-85.ngrok-free.app/api';

  @override
  void onInit() {
    super.onInit();
    // Load initial data from GetStorage
    name.text = storage.read('NAME') ?? '';
    email.text = storage.read('EMAIL') ?? '';
    id = storage.read('ID'); // Baca ID dari GetStorage
  }

  Future<void> doUpdateProfile() async {
    TFullScreenLoader.openLoadingDialog(
        'We are processing your information...', TImages.decorAnimation);

    // Check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;

    // Form Validation
    if (!profileFormKey.currentState!.validate()) {
      TLoaders.errorSnackBar(
          title: 'Invalid Form', message: 'Please fill all fields correctly.');
      TFullScreenLoader.stopLoading();
      return;
    }

    // HTTP Request
    final url = Uri.parse('$_baseUrl/update_profile');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': id,
        'name': name.text.trim(),
        'email': email.text.trim(),
      }),
    );

    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body); // Parsing JSON
        final message = data['message'];

        // Tampilkan pesan keberhasilan
        TLoaders.successSnackBar(title: 'Success', message: message);

        // Update data di GetStorage jika perlu
        storage.write('ID', id);
        storage.write('NAME', name.text.trim());
        storage.write('EMAIL', email.text.trim());

        // Stop loading
        TFullScreenLoader.stopLoading();

        // Redirect to login page
        AuthenticationRepository.instance.screenRedirect();
      } catch (e) {
        TLoaders.errorSnackBar(
            title: 'Parsing Error', message: 'Invalid response format.');
        // Stop loading
        TFullScreenLoader.stopLoading();
      }
    } else {
      // Tangani respons gagal
      final error = jsonDecode(response.body);
      final message = error['message'];
      TLoaders.errorSnackBar(title: 'Error', message: message);

      // Stop loading
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> doLogout() async {
    // Clear user data
    await storage.erase();

    // Redirect to login page
    AuthenticationRepository.instance.screenRedirect();
  }
}
