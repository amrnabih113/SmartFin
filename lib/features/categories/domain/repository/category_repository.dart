import 'package:smartFin/features/categories/domain/entities/category_entity.dart';

abstract class CategoryRepository {

  Future<CategoryEntity> getCategoryById(String categoryId);

  Future<List<CategoryEntity>> getAllCategories();

  Future<void> createCategory(CategoryEntity category);

  Future<void> updateCategory(CategoryEntity category);
  
  Future<void> deleteCategory(String categoryId);

  Future<List<CategoryEntity>> getTopFiveCategories(String type);

}

