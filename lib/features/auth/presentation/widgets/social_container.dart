// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';

class SocialContainer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final bool showBorders;
  final Color backgroundColor;
  final Widget child;
  final VoidCallback? onTap;

  const SocialContainer({
    super.key,
    required this.height,
    required this.width,
    this.radius = MySizes.borderRadiousLg,
    this.showBorders = true,
    this.backgroundColor = Colors.transparent,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: showBorders
                ? Border.all(
                    width: 2,
                    color: MyColors.darkGrey,
                  )
                : null,
            borderRadius: BorderRadius.circular(radius)),
        child: Padding(
          padding: const EdgeInsets.all(MySizes.sm),
          child: child,
        ),
      ),
    );
  }
}
