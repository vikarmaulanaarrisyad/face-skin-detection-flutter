import 'package:face_skin_detection_flutter/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // PageController untuk mengontrol PageView
  final PageController pageController = PageController();

  // Variabel untuk melacak halaman saat ini
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index ketika halaman digeser
  void updatePageIndicator(int index) {
    currentPageIndex.value = index; // Update the value of currentPageIndex
  }

  // Melompat ke halaman tertentu berdasarkan klik pada dot
  void dotNavigationClick(int index) {
    currentPageIndex.value = index; // Update the value of currentPageIndex
    pageController
        .jumpToPage(index); // Corrected the method to jump to the page
  }

  // Melompat ke halaman berikutnya dan memperbarui indeks
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController
          .jumpToPage(page); // Corrected the method to jump to the page
    }
  }

  // Melompat langsung ke halaman terakhir dan memperbarui indeks
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2); // Corrected the method to jump to the page
  }
}
