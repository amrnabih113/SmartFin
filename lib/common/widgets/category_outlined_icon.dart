import 'package:flutter/material.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';

class CategoryOutlinedIcon extends StatelessWidget {
  final double size;
  final bool hasBorder;
  final MaterialColor color;
  final IconData icon;

  const CategoryOutlinedIcon({
    super.key,
    this.size = 28,
    this.hasBorder = true,
    required this.color,
    required this.icon ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MySizes.sm),
      decoration: hasBorder
          ? BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: MyColors.primaryBorderDark,
              ))
          : null,
      child: GradientIcon(
        icon: icon,
        size: size,
        gradient: MyColors.customGradient(color),
      ),
    );
  }
}
