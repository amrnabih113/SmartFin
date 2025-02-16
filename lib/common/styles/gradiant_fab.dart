import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';

class GradientFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, gradient: MyColors.secondaryGradient),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
