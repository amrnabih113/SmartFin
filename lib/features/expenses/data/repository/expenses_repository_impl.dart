import 'package:flutter/services.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/features/expenses/data/services/expenses_local_data_sourse.dart';
import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/repository/expenses_repository.dart';
import 'package:sqflite/sqflite.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  final ExpensesLocalDataSource _expensesLocalDataSource;
  final MyLocalStorage _myLocalStorage;

  ExpensesRepositoryImpl(this._expensesLocalDataSource, this._myLocalStorage);

  @override
  Future<List<ExpenseEntity>> getExpensesByAccount(String accountId) async {
    try {
      final userId = _myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not logged in');
      }
      return await _expensesLocalDataSource.getExpenses(
        userId: userId,
        accountId: accountId,
      );
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
  Future<List<ExpenseEntity>> getExpensesByBudget(String budgetId) async {
    try {
      final userId = _myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not logged in');
      }
      return await _expensesLocalDataSource.getExpenses(
        userId: userId,
        budgetId: budgetId,
      );
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
  Future<List<ExpenseEntity>> getExpensesByCategory(String categoryId) async {
    try {
      final userId = _myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not logged in');
      }
      return await _expensesLocalDataSource.getExpenses(
        userId: userId,
        categoryId: categoryId,
      );
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
  Future<List<ExpenseEntity>> getExpensesByDate(DateTime date) {
    try {
      final userId = _myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not logged in');
      }
      return _expensesLocalDataSource.getExpenses(
        userId: userId,
        date: date,
      );
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
  Future<List<ExpenseEntity>> getExpensesByDateRange(
      DateTime startDate, DateTime endDate) async {
    try {
      final userId = _myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not logged in');
      }
      return await _expensesLocalDataSource.getExpenses(
        userId: userId,
        startDate: startDate,
        endDate: endDate,
      );
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
  Future<List<ExpenseEntity>> getExpensesByMonth(
      String month, String year) async {
    try {
      final userId = _myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not logged in');
      }
      print("starting");
      final response = await _expensesLocalDataSource.getExpenses(
        userId: userId,
        month: month,
        year: year,
      );
      print("ending ============== $response");
      return response;
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
  Future<List<ExpenseEntity>> getExpensesByYear(String year) async {
    try {
      final userId = _myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        throw Exception('User not logged in');
      }
      return await _expensesLocalDataSource.getExpenses(
        userId: userId,
        year: year,
      );
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
