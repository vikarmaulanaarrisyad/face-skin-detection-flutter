import 'package:face_skin_detection_flutter/utils/theme/custom_themes/appbar_theme.dart';
import 'package:face_skin_detection_flutter/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:face_skin_detection_flutter/utils/theme/custom_themes/chip_theme.dart';
import 'package:face_skin_detection_flutter/utils/theme/custom_themes/outline_buttom_theme.dart';
import 'package:face_skin_detection_flutter/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:face_skin_detection_flutter/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:face_skin_detection_flutter/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtomTheme.lightOutlinedButtomTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtomTheme.darkOutlinedButtomTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
  );
}
