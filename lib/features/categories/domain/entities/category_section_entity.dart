import 'package:smartFin/features/categories/domain/entities/category_entity.dart';

class CategorySectionEntity {
  final String title;
  List<CategoryEntity> categories;
  CategorySectionEntity({required this.title, required this.categories});}