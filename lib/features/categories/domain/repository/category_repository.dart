import 'package:smartFin/features/categories/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategories();

  Future<CategoryModel> createCategory(CategoryModel category);

  Future<CategoryModel> updateCategory(CategoryModel category);
  Future<void> deleteCategory(String categoryId);

  Future<List<CategoryModel>> getTopFiveCategories(String type);

  Future<void> syncCategoriesWithRemote();

}

