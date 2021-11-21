import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseConnection {
  static Future<Database> getDatabaseConnection() async {
    final databasePath = await getDatabasesPath();
    final fullPath = path.join(databasePath, 'contacts.db');
    return openDatabase(
      fullPath,
      onCreate: (database, version) => _createDatabase(database),
      version: 1,
    );
  }

  static void _createDatabase(Database database) {
    database.execute("""
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        number TEXT NOT NULL
      )
    """);
  }
}
