import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';

class GradientOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Gradient gradient;
  final double borderRadius;
  final EdgeInsets padding;
  final Widget child;

  const GradientOutlinedButton({
    super.key,
    required this.onPressed,
    this.gradient = MyColors.primaryGradient,
    this.borderRadius = 60.0,
    this.padding = const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.transparent), // Prevents artifacts
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: const BorderSide(
            width: 2.0,
            color: MyColors.secondaryColor,
          ),
        ).copyWith(
          side: WidgetStateProperty.resolveWith<BorderSide>(
            (states) => const BorderSide(
              width: 2.0,
              color: MyColors.primaryColor,
            ),
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => Colors.white,
          ),
        ),
        child: ShaderMask(
          shaderCallback: (bounds) => gradient.createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: child,
        ),
      ),
    );
  }
}
