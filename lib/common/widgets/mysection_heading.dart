import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/styles/gradiant_text.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';

class MySectionHeading extends StatelessWidget {
  const MySectionHeading({
    super.key,
    required this.title,
    this.onPressed,
    this.buttontext,
    this.showActionButton = false,
    this.textColor,
    this.isText = false,
    this.style,
  });

  final String title;
  final VoidCallback? onPressed;
  final String? buttontext;
  final bool showActionButton;
  final Color? textColor;
  final bool? isText;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MyHelperFunctions.isDarkMode(context);
    final TextStyle effectiveStyle = style ??
        Theme.of(context).textTheme.headlineSmall!.apply(
              color: textColor ?? (darkMode ? MyColors.white : MyColors.dark),
            );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: effectiveStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          isText == true
              ? TextButton(
                  onPressed: onPressed,
                  child: GradientText(
                    text: buttontext ?? "See All",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              : IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Iconsax.setting_5,
                    // HugeIcons.strokeRoundedSettings04,
                    color: darkMode ? MyColors.white : MyColors.dark,
                  ),
                ),
      ],
    );
  }
}
