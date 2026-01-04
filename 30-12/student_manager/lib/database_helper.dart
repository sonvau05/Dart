import 'package:sqlite3/sqlite3.dart';
import 'student.dart';

class DatabaseHelper {
  late Database db;

  DatabaseHelper() {
    db = sqlite3.open('students.db');
    db.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        idCard TEXT NOT NULL,
        name TEXT NOT NULL
      );
    ''');
  }

  void addStudent(String idCard, String name) {
    db.execute('INSERT INTO students (idCard, name) VALUES (?, ?)', [idCard, name]);
  }

  List<Student> getAllStudents() {
    final ResultSet results = db.select('SELECT * FROM students');
    return results.map((row) => Student(idCard: row['idCard'], name: row['name'])).toList();
  }

  Student? findByCode(String code) {
    final ResultSet results = db.select('SELECT * FROM students WHERE idCard = ?', [code]);
    if (results.isEmpty) return null;
    return Student(idCard: results.first['idCard'], name: results.first['name']);
  }
}