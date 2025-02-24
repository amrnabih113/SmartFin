import 'package:sqflite/sqflite.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/categories/data/models/category_model.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';
import 'package:smartFin/features/categories/data/services/local/sqflite_categories_service.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final SqfliteCategoriesService sqfliteCategoriesService;

  CategoryRepositoryImpl({required this.sqfliteCategoriesService});

  @override
  Future<CategoryModel> createCategory(CategoryModel category) async {
    try {
      return await sqfliteCategoriesService.createCategory(category);
    } on DatabaseException catch (e) {
      throw Failure(message: "Database error: ${e.toString()}");
    } catch (e) {
      throw Failure(message: "Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    try {
      await sqfliteCategoriesService.deleteCategory(categoryId);
    } on DatabaseException catch (e) {
      throw Failure(message: "Failed to delete category: ${e.toString()}");
    } catch (e) {
      throw Failure(message: "Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      return await sqfliteCategoriesService.getCategories();
    } on DatabaseException catch (e) {
      throw Failure(message: "Failed to fetch categories: ${e.toString()}");
    } catch (e) {
      throw Failure(message: "Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<List<CategoryModel>> getTopFiveCategories(String type) async {
    try {
      return await sqfliteCategoriesService.getTopFiveCategories(type);
    } on DatabaseException catch (e) {
      throw Failure(message: "Failed to fetch top categories: ${e.toString()}");
    } catch (e) {
      throw Failure(message: "Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<CategoryModel> updateCategory(CategoryModel category) async {
    try {
      return await sqfliteCategoriesService.updateCategory(category);
    } on DatabaseException catch (e) {
      throw Failure(message: "Failed to update category: ${e.toString()}");
    } catch (e) {
      throw Failure(message: "Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<void> syncCategoriesWithRemote() async {
    try {
      await sqfliteCategoriesService.syncCategoriesWithRemote();
    } on DatabaseException catch (e) {
      throw Failure(
          message: "Failed to sync categories with remote: ${e.toString()}");
    } catch (e) {
      throw Failure(message: "Unexpected error: ${e.toString()}");
    }
  }
}

