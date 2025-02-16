// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:smartFin/core/constants/colors.dart';

class GradientElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Gradient gradientColors;
  final double borderRadius;
  final EdgeInsets padding;
  final Widget child;

  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    this.gradientColors = MyColors.primaryGradient,
    this.borderRadius = 60.0,
    this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: gradientColors,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          shadowColor: Colors.transparent,
        ),
        child: child,
      ),
    );
  }
}
