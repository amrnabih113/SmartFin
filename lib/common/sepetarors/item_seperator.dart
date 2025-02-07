import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/sizes.dart';

class ItemSperator {

  static Widget vertical()
  {
    return const SizedBox(height: MySizes.spaceBetweenItems,);
  }

  static Widget horizontal()
  {
    return const SizedBox(width: MySizes.spaceBetweenItems,);
  }

  static Widget doubleVertical(){
    return const SizedBox(height: MySizes.spaceBetweenItems*2,);
  }

  static Widget doubleHorizontal(){
    return const SizedBox(width: MySizes.spaceBetweenItems*2,);
  }

  static Widget halfVertical(){
    return const SizedBox(height: MySizes.defaultSpacing/2,);
  }

  static Widget halfHorizontal(){
    return const SizedBox(width: MySizes.defaultSpacing/2,);
  }
}
