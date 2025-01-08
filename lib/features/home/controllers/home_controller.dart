import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carausalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carausalCurrentIndex.value = index;
  }
}
