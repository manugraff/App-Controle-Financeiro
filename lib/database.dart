import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'expense.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'expenses.db');
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE expenses(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount REAL,
        description TEXT,
        date TEXT,
        location TEXT
      )
    ''');
  }

  Future<int> insertExpense(Expense expense) async {
    Database db = await this.database;
    var result = await db.insert('expenses', expense.toMap());
    return result;
  }

  Future<int> updateExpense(Expense expense) async {
    var db = await this.database;
    var result = await db.update('expenses', expense.toMap(),
        where: 'id = ?', whereArgs: [expense.id]);
    return result;
  }

  Future<int> deleteExpense(int id) async {
    var db = await this.database;
    int result =
    await db.delete('expenses', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<List<Expense>> getExpenses() async {
    var db = await this.database;
    var result = await db.query('expenses', orderBy: 'date DESC');
    List<Expense> expenses =
    result.isNotEmpty ? result.map((expense) => Expense.fromMap(expense)).toList() : [];
    return expenses;
  }
}
