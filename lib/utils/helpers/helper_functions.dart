import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THelperFunctions {
  static Color? getColors(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else {
      return null;
    }
  }

  static void showSnackBar(String message) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } else {
      debugPrint("Get.context is null, unable to show SnackBar");
    }
  }

  static void showAlert(String title, String message) {
    if (Get.context != null) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), // Fixed here
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      debugPrint("Get.context is null, unable to show AlertDialog");
    }
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLenght) {
    if (text.length <= maxLenght) {
      return text;
    } else {
      return '${text.substring(0, maxLenght)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
