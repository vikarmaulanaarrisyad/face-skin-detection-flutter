import 'package:face_skin_detection_flutter/common/widgets/login_signup/form_divider.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/signup/signup.dart';
import 'package:face_skin_detection_flutter/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:face_skin_detection_flutter/utils/constants/text_strings.dart';
import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpScreen Widget Test', () {
    testWidgets('Should display the correct title, form, and divider',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpScreen(),
        ),
      );

      // Act
      final titleFinder = find.text(TTexts.signupTitle);
      final formFinder = find.byType(TSignUpForm);
      final dividerFinder = find.byType(TFormDivider);

      // Assert
      expect(titleFinder, findsOneWidget);
      expect(formFinder, findsOneWidget);
      expect(dividerFinder, findsOneWidget);
    });

    testWidgets('Should have padding around the content',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpScreen(),
        ),
      );

      // Act
      final paddingFinder = find.byType(Padding);

      // Assert
      expect(paddingFinder, findsWidgets);

      final Padding paddingWidget =
          tester.widget<Padding>(find.byType(Padding).first);
      expect(paddingWidget.padding, const EdgeInsets.all(TSizes.defaultSpace));
    });

    testWidgets('Should have correct spacing between sections',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpScreen(),
        ),
      );

      // Act
      final sizedBoxFinder = find.byType(SizedBox);

      // Assert
      expect(sizedBoxFinder, findsWidgets);

      final SizedBox sizedBoxWidget =
          tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBoxWidget.height, TSizes.spaceBtwSections);
    });
  });
}
