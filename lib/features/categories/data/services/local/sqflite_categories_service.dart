import 'package:smartFin/features/categories/data/models/category_model.dart';

abstract class SqfliteCategoriesService {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getTopFiveCategories(String type);
  Future<void> deleteCategory(String categoryId);
  Future<CategoryModel> createCategory(CategoryModel category);
  Future<CategoryModel> updateCategory(CategoryModel category);
  Future<void> syncCategoriesWithRemote();
 }