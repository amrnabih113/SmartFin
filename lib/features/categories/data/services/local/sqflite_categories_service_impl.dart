import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/features/categories/data/models/category_model.dart';
import 'package:smartFin/features/categories/data/services/local/sqflite_categories_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SqfliteCategoriesServiceImpl implements SqfliteCategoriesService {
  final SqliteService sqliteService;
  final SupabaseClient supabase;

  SqfliteCategoriesServiceImpl(this.sqliteService, this.supabase);

  @override
  Future<CategoryModel> createCategory(CategoryModel category) async {
    final db = await sqliteService.database;
    final int response = await db.insert('categories', category.toMap());

    return category.copyWith(id: response.toString());
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    final db = await sqliteService.database;

    await db.delete('categories', where: 'id = ?', whereArgs: [categoryId]);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final db = await sqliteService.database;
    final List<Map<String, dynamic>> result = await db.query('categories');

    return result.map((map) => CategoryModel.fromMap(map)).toList();
  }

  @override
  Future<List<CategoryModel>> getTopFiveCategories(String type) async {
    final db = await sqliteService.database;
    final List<Map<String, dynamic>> result = await db.query(
      'categories',
      orderBy: 'transactions_count DESC',
      where: "type = ?",
      whereArgs: [type],
      limit: 5,
    );
    return result.map((map) => CategoryModel.fromMap(map)).toList();
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    final db = await sqliteService.database;
    await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  @override
  Future<CategoryModel> getCategoryById(String categoryId) async {
    final db = await sqliteService.database;
    final response = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [categoryId],
    );
    if (response.isEmpty) {
      return CategoryModel.empty();
    }

    return CategoryModel.fromMap(response.first);
  }
}
