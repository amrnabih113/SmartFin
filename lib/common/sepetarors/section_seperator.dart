import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/sizes.dart';

class SectionSeperator {
  static Widget vertical() {
    return const SizedBox(height: MySizes.spaceBetweenSections,);
  }

  static Widget doubleVertical() {
    return const SizedBox(height: MySizes.spaceBetweenSections * 2,);
  }

  static Widget horizontal() {
    return const SizedBox(width: MySizes.spaceBetweenSections,);
  }

  static Widget doubleHorizontal() {
    return const SizedBox(width: MySizes.spaceBetweenSections * 2,);
  }
  
}
