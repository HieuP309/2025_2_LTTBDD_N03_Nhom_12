import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;

    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    String path = join(
      await databaseFactory.getDatabasesPath(),
      "expense_v2.db",
    );

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
        CREATE TABLE expenses(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          money INTEGER,
          date TEXT,
          note TEXT
        )
        ''');
        },
      ),
    );
  }

  static Future<List<Map<String, dynamic>>>
  getExpenses() async {
    final dbClient = await db;

    return await dbClient.query(
      "expenses",
      orderBy: "id DESC",
    );
  }

  static Future<int> insertExpense(
    String name,
    int money,
    String date,
    String note,
  ) async {
    final dbClient = await db;

    return await dbClient.insert("expenses", {
      "name": name,
      "money": money,
      "date": date,
      "note": note,
    });
  }

  static Future deleteExpense(int id) async {
    final dbClient = await db;

    await dbClient.delete(
      "expenses",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
