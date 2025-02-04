
import 'package:flutter/material.dart';
import 'package:smartFin/config/theme/custom_themes/appbar_theme.dart';
import 'package:smartFin/config/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:smartFin/config/theme/custom_themes/checkbox_theme.dart';
import 'package:smartFin/config/theme/custom_themes/chip_theme.dart';
import 'package:smartFin/config/theme/custom_themes/elevation_button_theme.dart';
import 'package:smartFin/config/theme/custom_themes/outlined_buttom_theme.dart';
import 'package:smartFin/config/theme/custom_themes/text_field_theme.dart';
import 'package:smartFin/config/theme/custom_themes/text_theme.dart';
import 'package:smartFin/core/constants/colors.dart';


class MyAppTheme {
  MyAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: MyColors.primaryColor,
    textTheme: MyTextTheme.lightTextTheme,
    chipTheme: MyChipTheme.lightChipTheme,
    scaffoldBackgroundColor: MyColors.white,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: MyTextFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: MyElevationButtonTheme.lightelevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: MyColors.primaryColor,
    textTheme: MyTextTheme.darkTextTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    scaffoldBackgroundColor: MyColors.dark,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: MyTextFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: MyElevationButtonTheme.darkElevatedButtonTheme,
  );
}
