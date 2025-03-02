import 'package:flutter/services.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:smartFin/features/categories/data/models/category_model.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';
import 'package:smartFin/features/categories/data/services/local/sqflite_categories_service.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final SqfliteCategoriesService sqfliteCategoriesService;

  CategoryRepositoryImpl({required this.sqfliteCategoriesService});

  @override
  Future<void> createCategory(CategoryEntity category) async {
    try {
      await sqfliteCategoriesService
          .createCategory(CategoryModel.fromEntity(category));
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    try {
      await sqfliteCategoriesService.deleteCategory(categoryId);
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    try {
      return await sqfliteCategoriesService.getCategories();
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<CategoryEntity>> getTopFiveCategories(String type) async {
    try {
      return await sqfliteCategoriesService.getTopFiveCategories(type);
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateCategory(CategoryEntity category) async {
    try {
      await sqfliteCategoriesService
          .updateCategory(CategoryModel.fromEntity(category));
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CategoryEntity> getCategoryById(String categoryId) async {
    try {
      return await sqfliteCategoriesService.getCategoryById(categoryId);
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
