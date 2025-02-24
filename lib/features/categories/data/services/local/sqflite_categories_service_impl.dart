import 'package:sqflite/sqflite.dart';
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
    try {
      final db = await sqliteService.database;
      final int response = await db.insert('categories', category.toMap());

      if (response > 0) {
        return category.copyWith(id: response.toString());
      } else {
        throw Exception("Failed to insert category into the database.");
      }
    } on DatabaseException catch (e) {
      throw Exception("Database error: ${e.toString()}");
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    try {
      final db = await sqliteService.database;
      final int response = await db
          .delete('categories', where: 'id = ?', whereArgs: [categoryId]);

      if (response == 0) {
        throw Exception("Category with ID $categoryId not found.");
      }
    } on DatabaseException catch (e) {
      throw Exception("Database error: ${e.toString()}");
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final db = await sqliteService.database;
      final List<Map<String, dynamic>> result = await db.query('categories');

      return result.map((map) => CategoryModel.fromMap(map)).toList();
    } on DatabaseException catch (e) {
      throw Exception("Database error: ${e.toString()}");
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<List<CategoryModel>> getTopFiveCategories(String type) async {
    try {
      final db = await sqliteService.database;
      final List<Map<String, dynamic>> result = await db.query(
        'categories',
        orderBy: 'transactions_count DESC',
        where: "type = ?",
        whereArgs: [type],
        limit: 5,
      );
      return result.map((map) => CategoryModel.fromMap(map)).toList();
    } on DatabaseException catch (e) {
      throw Exception("Database error: ${e.toString()}");
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<CategoryModel> updateCategory(CategoryModel category) async {
    try {
      final db = await sqliteService.database;
      final int response = await db.update(
        'categories',
        category.toMap(),
        where: 'id = ?',
        whereArgs: [category.id],
      );

      if (response == 0) {
        throw Exception("Failed to update category with ID ${category.id}.");
      }

      return category;
    } on DatabaseException catch (e) {
      throw Exception("Database error: ${e.toString()}");
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<void> syncCategoriesWithRemote() async {
    final db = await sqliteService.database;

    /// 1️⃣ Fetch Unsynced Local categories (status = 'pending')
    final unsyncedcategories = await db.query(
      "categories",
      where: "sync_status = ?",
      whereArgs: ["pending"],
    );

    if (unsyncedcategories.isNotEmpty) {
      /// Push to Supabase
      await supabase.from("categories").insert(unsyncedcategories);

      /// Mark as Synced in SQLite
      for (var transaction in unsyncedcategories) {
        await db.update(
          "categories",
          {"sync_status": "synced"},
          where: "id = ?",
          whereArgs: [transaction["id"]],
        );
      }
    }

    /// 2️⃣ Fetch New Remote categories (not present in SQLite)
    final remotecategories = await supabase.from("categories").select();
    try {
      for (var transaction in remotecategories) {
        final existing = await db.query(
          "categories",
          where: "id = ?",
          whereArgs: [transaction["id"]],
        );

        if (existing.isEmpty) {
          await db
              .insert("categories", {...transaction, "sync_status": "synced"});
        }
      }

      /// 3️⃣ Delete categories Marked as Deleted Locally
      final deletedcategories = await db.query(
        "categories",
        where: "sync_status = ?",
        whereArgs: ["deleted"],
      );

      for (var transaction in deletedcategories) {
        await supabase.from("categories").delete().eq("id", transaction["id"]!);
        await db.delete("categories",
            where: "id = ?", whereArgs: [transaction["id"]]);
      }
    } on Exception catch (e) {
      throw Exception("Failed to sync categories with remote: $e");
    }
  }
}
