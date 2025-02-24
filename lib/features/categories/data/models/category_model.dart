import 'dart:convert';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.color,
    required super.type,
    required super.transactionsCount,
  });

  /// Convert to `CategoryEntity`
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      icon: icon,
      color: color,
      type: type,
      transactionsCount: transactionsCount,
    );
  }

  /// Create a `CategoryModel` from `CategoryEntity`
  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      icon: entity.icon,
      color: entity.color,
      type: entity.type,
      transactionsCount: entity.transactionsCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'color': color,
      'type': type,
      'transactions_count': transactionsCount,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
      icon: map['icon'].toString(),
      color: map['color'].toString(),
      type: map['type'].toString(),
      transactionsCount: (map['transactions_count'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  CategoryModel copyWith({
    String? id,
    String? name,
    String? icon,
    String? color,
    String? type,
    int? transactionsCount,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      type: type ?? this.type,
      transactionsCount: transactionsCount ?? this.transactionsCount,
    );
  }
}

