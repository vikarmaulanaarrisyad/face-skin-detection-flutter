import 'package:face_skin_detection_flutter/features/authentication/screens/login/login.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Inisialisasi GetStorage
  final deviceStorage = GetStorage();

  // Dipanggil saat aplikasi siap
  @override
  void onReady() {
    FlutterNativeSplash.remove(); // Menghapus splash screen
    screenRedirect(); // Panggil fungsi redirect
  }

  // Fungsi untuk menentukan layar tujuan
  screenRedirect() async {
    // localStorage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

  // REGISTER
}
