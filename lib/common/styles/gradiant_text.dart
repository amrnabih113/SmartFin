import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.gradient = MyColors.primaryGradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
