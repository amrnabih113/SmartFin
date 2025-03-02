import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:smartFin/config/routing/screen_redirect.dart';
import 'package:smartFin/core/constants/supabase_constants.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/myapp.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'firebase_options.dart';

void main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  
  await GetStorage.init();

  await Di.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: SupabaseConstants.url,
    anonKey: SupabaseConstants.anonKey,
  );
  // final dbPath = join(await getDatabasesPath(), "smartfin.db");
  // await deleteDatabase(dbPath);
  
  Get.put(ScreenRedirect(sl()));

  runApp(const MyApp());
}

Future addTestData() async {
  final sqliteService = sl<SqliteService>();
  final myLocalStorage = MyLocalStorage.instance();
  final userId = myLocalStorage.readData<String>(MyTexts.userId);

  if (userId == null) {
    throw Exception("User ID is null. Cannot insert transactions.");
  }

  final transactions = [
    {
      'name': 'Salary',
      'amount': 10000.0,
      'transaction_type': 'income',
      'note': 'Monthly salary'
    },
    {
      'name': 'Freelance',
      'amount': 1200.0,
      'transaction_type': 'income',
      'note': 'Freelance project payment'
    },
    {
      'name': 'Invest Rtns',
      'amount': 800.0,
      'transaction_type': 'income',
      'note': 'Stock market returns'
    },
    {
      'name': 'Rent',
      'amount': 500.0,
      'transaction_type': 'expense',
      'note': 'House rent payment'
    },
    {
      'name': 'Elec Bill',
      'amount': 200.0,
      'transaction_type': 'expense',
      'note': 'Electricity bill'
    },
    {
      'name': 'Water Bill',
      'amount': 50.0,
      'transaction_type': 'expense',
      'note': 'Water bill'
    },
    {
      'name': 'Net Subs',
      'amount': 30.0,
      'transaction_type': 'expense',
      'note': 'Internet subscription'
    },
    {
      'name': 'Fuel & Gas',
      'amount': 100.0,
      'transaction_type': 'expense',
      'note': 'Car fuel expense',
      'account_id': 'acc_002'
    }
  ];

  for (var transaction in transactions) {
    final category = await sqliteService.query('categories',
        whereClause: 'name = ?', whereArgs: [transaction['name']]);

    if (category.isEmpty || category.first['id'] == null) {
      print(
          "Warning: Category '${transaction['name']}' not found. Skipping transaction.");
      continue; // Skip transaction if category is missing
    }

    await sqliteService.insert('transactions', {
      'id': Uuid().v1(),
      'user_id': userId,
      'amount': transaction['amount'],
      'category_id': category.first['id'].toString(),
      'transaction_type': transaction['transaction_type'],
      'date': DateTime.now().toIso8601String(),
      'note': transaction['note'],
      'sync_status': 'pending',
      if (transaction.containsKey('account_id'))
        'account_id': transaction['account_id']
    });
  }
}
