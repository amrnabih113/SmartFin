import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';

class MyElevationButtonTheme {
  MyElevationButtonTheme._();

  static final lightelevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: MyColors.primaryColor,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
    side: BorderSide.none,
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'Poppins'),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12))),
  ));

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: MyColors.primaryColor,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontFamily: 'Poppins'),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
  );
}
