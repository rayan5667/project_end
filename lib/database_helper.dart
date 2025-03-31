import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database? _database;

  // ✅ إنشاء قاعدة البيانات أو استرجاعها إذا كانت موجودة
  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    String path = join(await getDatabasesPath(), 'user_data.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fullName TEXT,
            mobile TEXT,
            gender TEXT
          )
        ''');
      },
    );
    return _database!;
  }

  // ✅ حفظ بيانات المستخدم في قاعدة البيانات
  static Future<void> saveUser(String fullName, String mobile, String gender) async {
    final db = await getDatabase();
    await db.insert(
      'users',
      {'fullName': fullName, 'mobile': mobile, 'gender': gender},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ✅ استرجاع بيانات المستخدم من قاعدة البيانات
  static Future<Map<String, dynamic>?> getUser() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> users = await db.query('users', limit: 1);
    return users.isNotEmpty ? users.first : null;
  }
}
