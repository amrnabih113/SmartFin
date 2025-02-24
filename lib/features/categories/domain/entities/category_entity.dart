import 'package:flutter/material.dart';
import 'package:smartFin/core/Icons/icons.dart';
import 'package:smartFin/core/constants/colors.dart';

class CategoryEntity {
  final String id;
  final String name;
  final String icon;
  final String type;
  final int transactionsCount;
  final String color;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
    required this.transactionsCount,
    required this.color,
  });

  CategoryEntity copyWith({
    String? id,
    String? name,
    String? icon,
    String? type,
    int? transactionsCount,
    String? color,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      type: type ?? this.type,
      transactionsCount: transactionsCount ?? this.transactionsCount,
      color: color ?? this.color,
    );
  }

  MaterialColor get materialColor => MyColors.getMaterialColor(color);

  IconData get iconData => MyIcons.getIconData(icon);

  factory CategoryEntity.empty() => const CategoryEntity(
      id: '',
      name: '',
      icon: '',
      type: '',
      transactionsCount: 0,
      color: '',
    );
  }

