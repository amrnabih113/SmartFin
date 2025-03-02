import 'package:smartFin/features/categories/data/models/category_model.dart';

abstract class SqfliteCategoriesService {
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel> getCategoryById(String categoryId);
  Future<List<CategoryModel>> getTopFiveCategories(String type);
  Future<void> deleteCategory(String categoryId);
  Future<void> createCategory(CategoryModel category);
  Future<void> updateCategory(CategoryModel category);
 }