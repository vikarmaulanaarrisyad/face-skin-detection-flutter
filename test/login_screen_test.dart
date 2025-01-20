import 'package:face_skin_detection_flutter/common/styles/spacing_styles.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginScreen Widget Test', () {
    testWidgets('Should have padding around the content',
        (WidgetTester tester) async {
      // Arrange: Render the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Wait for any timers, animations, or async operations to complete
      await tester.pumpAndSettle();

      // Act: Find the Padding widget
      final paddingFinder = find.byType(Padding);

      // Assert: Ensure Padding widget exists
      expect(paddingFinder, findsWidgets);

      // Get the first Padding widget and check its padding
      final Padding paddingWidget =
          tester.widget<Padding>(find.byType(Padding).first);

      // Assert: Verify the padding is correct
      expect(paddingWidget.padding, TSpacingStyle.paddingWithAppBarHeight);
    });
  });
}
