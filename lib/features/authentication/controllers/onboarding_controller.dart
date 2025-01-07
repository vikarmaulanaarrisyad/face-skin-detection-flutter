import 'package:face_skin_detection_flutter/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // PageController untuk mengontrol PageView
  final PageController pageController = PageController();

  // Variabel untuk melacak halaman saat ini
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index ketika halaman digeser
  void updatePageIndicator(index) => currentPageIndex = index;

  // Melompat ke halaman tertentu berdasarkan klik pada dot
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Melompat ke halaman berikutnya dan memperbarui indeks
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Melompat langsung ke halaman terakhir dan memperbarui indeks
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
