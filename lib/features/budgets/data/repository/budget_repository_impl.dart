import 'package:flutter/services.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/features/budgets/data/models/budget_model.dart';
import 'package:smartFin/features/budgets/data/services/budget_local_data_sourse.dart';
import 'package:smartFin/features/budgets/domain/entites/budget_entity.dart';
import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';
import 'package:sqflite/sqlite_api.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetLocalDataSourse _budgetLocalDataSourse;
  final MyLocalStorage myLocalStorage;

  BudgetRepositoryImpl(this._budgetLocalDataSourse, this.myLocalStorage);
  @override
  Future<void> addBudget(BudgetEntity budget) async {
    try {
      await _budgetLocalDataSourse.addBudget(BudgetModel.fromEntity(budget));
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
  Future<void> deleteBudget(String budgetId) {
    try {
      return _budgetLocalDataSourse.deleteBudget(budgetId);
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
  Future<List<BudgetEntity>> getActiveBudgets() {
    try {
      final userId = myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not found');
      }
      return _budgetLocalDataSourse.getBudgets(
          userId: userId, status: 'active', isMain: 0);
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
  Future<BudgetEntity> getBudgetById(String id) async {
    try {
      final userId = myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not found');
      }
      final budgets =
          await _budgetLocalDataSourse.getBudgets(userId: userId, budgetId: id);
      return budgets.first;
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
  Future<List<BudgetEntity>> getBudgets() async {
    try {
      final userId = myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not found');
      }
      return await _budgetLocalDataSourse.getBudgets(userId: userId, isMain: 0);
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
  Future<BudgetEntity> getMainBudget() async {
    try {
      final userId = myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not found');
      }
      final budgets =
          await _budgetLocalDataSourse.getBudgets(userId: userId, isMain: 1);
      if (budgets.isEmpty) {
        return BudgetEntity.empty();
      }
      return budgets.first;
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
  Future<void> setMainBudget(BudgetEntity budget) async {
    try {
      return await _budgetLocalDataSourse
          .addBudget(BudgetModel.fromEntity(budget));
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
  Future<void> updateBudget(BudgetEntity budget) async {
    try {
      return await _budgetLocalDataSourse
          .updateBudget(BudgetModel.fromEntity(budget));
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
