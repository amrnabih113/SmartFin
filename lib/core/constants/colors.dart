import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  // App basic Colors
  static const Color primaryColor = Color(0xFFFF796A);
  static const Color secondaryColor = Color(0xFFF4C98A);
  static const Color accent = Color(0xFFB0C7FF);

  //Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      primaryColor,
      secondaryColor,
    ],
  );

  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0],
    colors: [
      primaryColor,
      white,
    ],
  );

  static customgradient(Color color) {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: const [0.0, 1.0],
      colors: [
        color,
        white,
      ],
    );
    
  }
  // Text Colors
  static const Color textPrimary = Color(0xFF3E3E40);
  static const Color textSecondary = Color(0xFF6c757d);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6f6f6);
  static const Color dark = Color(0xFF101422);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //Background container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = const Color(0xff171E2D);

  // Button Colors
  static const Color primaryButton = MyColors.primaryColor;
  static const Color secondaryButton = Color(0xff6c757d);
  static const Color disabledButton = Color(0xffc4c4c4);

  //border Colors
  static const Color primaryBorder = Color(0xFFD9D9D9);
  static const Color secondaryBorder = Color(0xFFE6E6E6);

  //Error Colors
  static const Color error = Color(0xFFDC3545);
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF17A2B8);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
