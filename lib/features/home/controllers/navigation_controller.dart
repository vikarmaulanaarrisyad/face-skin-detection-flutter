import 'package:face_skin_detection_flutter/features/camera/camera.dart';
import 'package:face_skin_detection_flutter/features/chatbot/screens/chatbot_screen.dart';
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
    const ChatbotScreen(),
    const CameraScreen(),
    const SettingsScreen()
  ];
}
