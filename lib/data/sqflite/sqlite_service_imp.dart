import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteService implements SqliteService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'smartfin.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createTables(db);
      },
    );
  }

  Future<void> _createTables(Database db) async {
    
    // Accounts table stores information about accounts
    await db.execute('''
      CREATE TABLE accounts (
        id TEXT PRIMARY KEY,
        owner_id TEXT,
        name TEXT NOT NULL,
        balance REAL NOT NULL DEFAULT 0,
        is_family_budget INTEGER NOT NULL DEFAULT 0,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      );
    ''');

    // AccountMembers table stores information about account members
    await db.execute('''
      CREATE TABLE account_members (
        id TEXT PRIMARY KEY,
        account_id TEXT NOT NULL,
        user_id TEXT NOT NULL,
        role TEXT NOT NULL CHECK(role IN ('owner', 'member')),
        joined_at TEXT DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (account_id) REFERENCES accounts (id) ON DELETE CASCADE,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      );
    ''');

    // Categories table stores information about categories
    await db.execute('''
      CREATE TABLE categories (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        name TEXT NOT NULL,
        type TEXT NOT NULL CHECK(type IN ('income', 'expense')),
        color TEXT NOT NULL,
        icon TEXT NOT NULL
      );
    ''');

    // Budgets table stores information about budgets
    await db.execute('''
      CREATE TABLE budgets (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        name TEXT NOT NULL,
        amount REAL NOT NULL,
        used_amount REAL NOT NULL DEFAULT 0,
        start_date TEXT NOT NULL,
        end_date TEXT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      );
    ''');

    // Transactions table stores information about transactions
    await db.execute('''
      CREATE TABLE transactions (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        amount REAL NOT NULL,
        category_id TEXT,
        account_id TEXT,
        budget_id TEXT,
        transaction_type TEXT NOT NULL CHECK(transaction_type IN ('income', 'expense')),
        date TEXT DEFAULT CURRENT_TIMESTAMP,
        note TEXT,
        FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL,
        FOREIGN KEY (account_id) REFERENCES accounts (id) ON DELETE SET NULL,
        FOREIGN KEY (budget_id) REFERENCES budgets (id) ON DELETE SET NULL
      );
    ''');

    // SyncStatus table stores information about sync status
    await db.execute('''
      CREATE TABLE sync_status (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        local_id TEXT NOT NULL,
        table_name TEXT NOT NULL,
        sync_status TEXT NOT NULL CHECK(sync_status IN ('pending', 'synced', 'failed'))
      );
    ''');
    
    // Debts table stores information about debts
    await db.execute('''
      CREATE TABLE debts (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        counterparty_name TEXT NOT NULL,
        amount REAL NOT NULL,
        remaining_amount REAL NOT NULL DEFAULT 0,
        due_date TEXT NOT NULL,
        type TEXT NOT NULL CHECK(type IN ('borrowed', 'lent')),
        status TEXT NOT NULL CHECK(status IN ('pending', 'paid', 'overdue')),
        note TEXT,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // Goals table stores information about goals
    await db.execute('''
      CREATE TABLE goals (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        name TEXT NOT NULL,
        target_amount REAL NOT NULL,
        saved_amount REAL NOT NULL DEFAULT 0,
        due_date TEXT,
        color TEXT NOT NULL,
        icon TEXT NOT NULL,
        status TEXT NOT NULL CHECK(status IN ('in_progress', 'achieved', 'failed')),
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  @override
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<int> update(String table, Map<String, dynamic> data, String whereClause, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.update(table, data, where: whereClause, whereArgs: whereArgs);
  }

  @override
  Future<int> delete(String table, String whereClause, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.delete(table, where: whereClause, whereArgs: whereArgs);
  }

  @override
  Future<List<Map<String, dynamic>>> query(String table, {String? whereClause, List<dynamic>? whereArgs}) async {
    final db = await database;
    return await db.query(table, where: whereClause, whereArgs: whereArgs);
  }
}

