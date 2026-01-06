import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  late Database db;

  DatabaseHelper() {
    db = sqlite3.open('students.db');
    db.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT, email TEXT UNIQUE, age INTEGER, isExpelled INTEGER
      )
    ''');
    db.execute('''
      CREATE TABLE IF NOT EXISTS subjects (
        student_id INTEGER, subject_name TEXT
      )
    ''');
  }
}