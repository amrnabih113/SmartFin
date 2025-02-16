import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';

class AddButton extends StatelessWidget {
  final double size;
  final bool hasBorder;

  const AddButton({
    super.key,
    this.size = 28,
    this.hasBorder = true,
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
        child: GradientIcon(icon: Iconsax.add, size: size));
  }
}
