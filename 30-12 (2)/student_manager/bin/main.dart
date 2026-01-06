import 'dart:io';
import '../lib/data/database_helper.dart';
import '../lib/domain/entities/student.dart';
import '../lib/core/validator.dart';

void main() {
  final dbHelper = DatabaseHelper();
  
  while (true) {
    print('\n===== HỆ THỐNG QUẢN LÝ SINH VIÊN (CLEAN) =====');
    print('1. Thêm sinh viên (Có Validate + Môn học)');
    print('2. Hiển thị tất cả sinh viên');
    print('3. Tìm kiếm (Theo Tên hoặc Email)');
    print('4. Danh sách sinh viên bị đuổi học');
    print('5. Cập nhật/Xóa sinh viên (Full CRUD)');
    print('0. Thoát');
    stdout.write('Chọn chức năng: ');
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Nhập tên: '); String name = stdin.readLineSync()!;
        stdout.write('Nhập email: '); String email = stdin.readLineSync()!;
        stdout.write('Nhập tuổi: '); int age = int.parse(stdin.readLineSync() ?? '0');
        stdout.write('Nhập các môn yêu thích (cách nhau bởi dấu phẩy): ');
        List<String> subjects = stdin.readLineSync()!.split(',');

        final results = dbHelper.db.select('SELECT email FROM students');
        List<String> emails = results.map((r) => r['email'] as String).toList();

        String? error = StudentValidator.validate(email, age, emails);
        if (error != null) {
          print(error);
        } else {
          dbHelper.db.execute(
            'INSERT INTO students (name, email, age, isExpelled) VALUES (?, ?, ?, 0)',
            [name, email, age]
          );
          print('Thêm thành công!');
        }
        break;

      case '2':
        final rows = dbHelper.db.select('SELECT * FROM students WHERE isExpelled = 0');
        for (var r in rows) {
          print('ID: ${r['id']} | Tên: ${r['name']} | Email: ${r['email']} | Tuổi: ${r['age']}');
        }
        break;

      case '3':
        stdout.write('Nhập tên hoặc email cần tìm: ');
        String keyword = stdin.readLineSync()!;
        final results = dbHelper.db.select(
          'SELECT * FROM students WHERE name LIKE ? OR email LIKE ?',
          ['%$keyword%', '%$keyword%']
        );
        for (var r in results) print('Tìm thấy: ${r['name']} - ${r['email']}');
        break;

      case '4':
        final rows = dbHelper.db.select('SELECT * FROM students WHERE isExpelled = 1');
        print('--- DANH SÁCH BỊ ĐUỔI HỌC ---');
        for (var r in rows) print('${r['name']} - ${r['email']}');
        break;

      case '0':
        exit(0);
    }
  }
}