import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';

class CategoryIconContainer extends StatelessWidget {
  const CategoryIconContainer({
    super.key,
    required this.color,
    required this.icon,
    this.size = 20,
    this.paddingValue = MySizes.sm,
  });

  final MaterialColor color;
  final IconData icon;
  final double size;
  final double paddingValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingValue),
      decoration: BoxDecoration(
        gradient: MyColors.customGradient(color),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: MyColors.white,
        size: size,
      ),
    );
  }
}
