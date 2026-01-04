import 'dart:io';
import '../lib/database_helper.dart';

void main() {
  final dbHelper = DatabaseHelper();
  
  while (true) {
    print('\n===== MENU QUẢN LÝ SINH VIÊN =====');
    print('1. Thêm sinh viên');
    print('2. Hiển thị danh sách sinh viên');
    print('3. Tìm sinh viên theo mã');
    print('0. Thoát');
    stdout.write('Chọn chức năng: ');
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Nhập mã SV: ');
        String idCard = stdin.readLineSync()!;
        stdout.write('Nhập tên SV: ');
        String name = stdin.readLineSync()!;
        dbHelper.addStudent(idCard, name);
        print('Đã thêm thành công!');
        break;
        
      case '2':
        var list = dbHelper.getAllStudents();
        print('--- DANH SÁCH SINH VIÊN ---');
        if (list.isEmpty) print('Trống!');
        for (var s in list) print(s);
        break;

      case '3':
        stdout.write('Nhập mã cần tìm: ');
        String code = stdin.readLineSync()!;
        var s = dbHelper.findByCode(code);
        if (s != null) {
          print('Kết quả: $s');
        } else {
          print('Không tìm thấy sinh viên mã $code');
        }
        break;

      case '0':
        print('Tạm biệt!');
        exit(0);
        
      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}