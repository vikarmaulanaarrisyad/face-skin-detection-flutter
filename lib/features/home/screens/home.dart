import 'package:face_skin_detection_flutter/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:face_skin_detection_flutter/features/home/screens/widgets/home_appbar.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
