import 'dart:io';

import 'package:smartFin/features/transactions/data/models/transactions_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_transactions_service.dart';

class SupabaseTransactionsServiceImpl implements SupabaseTransactionsService {
  final SupabaseClient supabase;

  SupabaseTransactionsServiceImpl(this.supabase);

  ///  Fetch transactions with optional filters
  @override
  Future<List<TransactionsModel>> getTransactions({
    String? accountId,
    String? categoryId,
    DateTime? endDate,
    DateTime? startDate,
    String? transactionType,
  }) async {
    try {
      var query = supabase.from("transactions").select();

      if (accountId != null) {
        query = query.eq("account_id", accountId);
      }

      if (categoryId != null) {
        query = query.eq("category_id", categoryId);
      }

      if (startDate != null) {
        query = query.gte("date", startDate.toIso8601String());
      }

      if (endDate != null) {
        query = query.lte("date", endDate.toIso8601String());
      }

      if (transactionType != null) {
        query = query.eq("transaction_type", transactionType);
      }

      final List data = await query.order("date", ascending: false);
      return data.map((json) => TransactionsModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw Exception("Failed to get transactions from Supabase: ${e.message}");
    } on SocketException {
      throw Exception("Internet connection error");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  ///  Add a transaction
  @override
  Future<int> addTransaction(TransactionsModel transaction) async {
    try {
      final response = await supabase
          .from("transactions")
          .insert(transaction.toJson())
          .select("id")
          .single();
      return response["id"] as int;
    } on PostgrestException catch (e) {
      throw Exception("Failed to get transactions from Supabase: ${e.message}");
    } on SocketException {
      throw Exception("Internet connection error");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  ///  Update a transaction
  @override
  Future<int> updateTransaction(TransactionsModel transaction) async {
    try {
      final response = await supabase
          .from("transactions")
          .update(transaction.toMap())
          .eq("id", transaction.id);
      return response.error == null ? 1 : 0;
    } on PostgrestException catch (e) {
      throw Exception("Failed to get transactions from Supabase: ${e.message}");
    } on SocketException {
      throw Exception("Internet connection error");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  ///  Delete a transaction
  @override
  Future<int> deleteTransaction(String transactionId) async {
    try {
      final response =
          await supabase.from("transactions").delete().eq("id", transactionId);
      return response.error == null ? 1 : 0;
    } on PostgrestException catch (e) {
      throw Exception("Failed to get transactions from Supabase: ${e.message}");
    } on SocketException {
      throw Exception("Internet connection error");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  ///  Batch insert transactions
  @override
  Future<void> batchInsertTransactions(
      List<TransactionsModel> transactions) async {
    try {
      await supabase
          .from("transactions")
          .insert(transactions.map((t) => t.toJson()).toList());
    } on PostgrestException catch (e) {
      throw Exception("Failed to get transactions from Supabase: ${e.message}");
    } on SocketException {
      throw Exception("Internet connection error");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  ///  Delete multiple transactions
  @override
  Future<int> deleteMultipleTransactions(List<String> transactionIds) async {
    try {
      final response =
          await supabase.from("transactions").delete().eq("id", transactionIds);
      return response.error == null ? transactionIds.length : 0;
    } on PostgrestException catch (e) {
      throw Exception("Failed to get transactions from Supabase: ${e.message}");
    } on SocketException {
      throw Exception("Internet connection error");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
