import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  // App basic Colors
  static const Color primaryColor = Color(0xFFFF796A);
  static const Color secondaryColor = Color(0xFFF4C98A);
  static const Color accent = Color(0xFFB0C7FF);
  static const Color darker = Color(0xFF0A0F15);
  static const Color buttonDark = Color.fromARGB(255, 32, 36, 52);
  static const Color buttonLight = Color(0xffE6E6E6);
  static const Color selectedButton = Color(0xFF262C3A);

  //Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.2, .8],
    colors: [
      primaryColor,
      secondaryColor,
    ],
  );

  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.5, 1.0],
    colors: [
      primaryColor,
      white,
    ],
  );

  static LinearGradient customGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [0.0, 0.5, 0.8],
      colors: [
        color.shade800,
        color.shade500,
        color.shade300,
      ],
    );
  }

  static LinearGradient customGradient2(Color color) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.5, 0.9],
      colors: [color, white],
    );
  }

  static SweepGradient customSweepGradient(MaterialColor color) {
    return SweepGradient(
      startAngle: 0.0,
      endAngle: 3.14 * 2, // Full circle
      tileMode: TileMode.clamp,
      colors: [
        color.shade900,
        color.shade700,
        color.shade500,
        color.shade300,
        color.shade100, // Fades out smoothly
      ],
      stops: const [0.2, 0.5, 0.7, 0.9, 1.0], // Controls smoothness
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
  static const Color primaryBorderDark = Color(0xFF272E3E);

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
