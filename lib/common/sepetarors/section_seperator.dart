import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/sizes.dart';

class SectionSeperator {
  static Widget vertical() {
    return const SizedBox(height: MySizes.spaceBetweenSections,);
  }

  static Widget horizontal() {
    return const SizedBox(width: MySizes.spaceBetweenSections,);
  }
}