import 'package:face_skin_detection_flutter/app.dart';
import 'package:face_skin_detection_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Inisialisasi GetStorage

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Bind AuthenticationRepository
  Get.put(AuthenticationRepository());

  runApp(const MyApp());
}
