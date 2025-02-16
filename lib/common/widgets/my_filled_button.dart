import 'package:flutter/material.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/core/constants/sizes.dart';

class MyFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final double iconSize;

  const MyFilledButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.iconSize = MySizes.iconMd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
            const SizedBox(width: 8.0),
            GradientIcon(icon: icon, size: iconSize),
          ],
        ),
      ),
    );
  }
}
