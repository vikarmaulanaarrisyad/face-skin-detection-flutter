import 'package:face_skin_detection_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final storage = GetStorage();

  Future<void> doLogout() async {
    // Hapus data pengguna dari GetStorage
    await storage
        .remove('ACCESS_TOKEN'); // Pastikan key sesuai dengan yang digunakan

    // Panggil fungsi untuk redirect ke halaman login
    AuthenticationRepository.instance.screenRedirect();
  }
}
