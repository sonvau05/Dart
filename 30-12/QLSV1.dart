import 'dart:io';

class Student {
  String id;
  String name;

  Student(this.id, this.name);
}

void main() {
  List<Student> students = [];
  bool isRunning = true;

  while (isRunning) {
    print("\n===== MENU QUẢN LÝ SINH VIÊN =====");
    print("1. Thêm sinh viên");
    print("2. Hiển thị danh sách sinh viên");
    print("3. Tìm sinh viên theo mã");
    print("0. Thoát");
    stdout.write("Chọn chức năng: ");
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        stdout.write("Nhập mã sinh viên: ");
        String id = stdin.readLineSync()!;
        stdout.write("Nhập tên sinh viên: ");
        String name = stdin.readLineSync()!;
        students.add(Student(id, name));
        print("Đã thêm thành công!");
        break;

      case "2":
        if (students.isEmpty) {
          print("Danh sách đang trống.");
        } else {
          print("\n--- DANH SÁCH SINH VIÊN ---");
          for (var s in students) {
            print("MSV: ${s.id} | Tên: ${s.name}");
          }
        }
        break;

      case "3":
        stdout.write("Nhập mã cần tìm: ");
        String searchId = stdin.readLineSync()!;
        var found = students.where((s) => s.id == searchId);
        
        if (found.isNotEmpty) {
          print("Kết quả: ${found.first.name}");
        } else {
          print("Không tìm thấy sinh viên có mã $searchId");
        }
        break;

      case "0":
        print("Tạm biệt!");
        isRunning = false;
        break;

      default:
        print("Lựa chọn không hợp lệ, vui lòng chọn lại!");
    }
  }
}