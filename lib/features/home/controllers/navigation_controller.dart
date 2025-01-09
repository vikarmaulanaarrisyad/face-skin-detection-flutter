import 'package:face_skin_detection_flutter/features/home/screens/home.dart';
import 'package:face_skin_detection_flutter/features/personalization/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(
      color: Colors.purple,
      child: const Center(
          child: Text('Artikel',
              style: TextStyle(fontSize: 24, color: Colors.white))),
    ),
    Container(
      color: Colors.red,
      child: const Center(
          child: Text('Deteksi',
              style: TextStyle(fontSize: 24, color: Colors.white))),
    ),
    const SettingsScreen()
  ];
}
