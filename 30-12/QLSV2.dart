import 'dart:io';

interface class IDisplayable {
  void displayBasicInfo() {}
}

abstract class Person implements IDisplayable {
  String id;
  String name;

  Person(this.id, this.name);

  void showFullDetail();

  @override
  void displayBasicInfo() {
    print("Mã: $id | Tên: $name");
  }
}

class Student extends Person {
  Student(String id, String name) : super(id, name);

  @override
  void showFullDetail() {
    print("\n>>>> CHI TIẾT SINH VIÊN <<<<");
    print("Mã số: $id");
    print("Họ tên: $name");
    print("Vai trò: Sinh viên");
    print("============================");
  }
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
        stdout.write("Nhập mã: ");
        String id = stdin.readLineSync()!;
        stdout.write("Nhập tên: ");
        String name = stdin.readLineSync()!;
        students.add(Student(id, name));
        print("Đã thêm thành công!");
        break;

      case "2":
        if (students.isEmpty) {
          print("Danh sách trống.");
        } else {
          print("\n--- DANH SÁCH SINH VIÊN ---");
          for (var s in students) {
            s.displayBasicInfo();
          }
        }
        break;

      case "3":
        stdout.write("Nhập mã cần tìm: ");
        String searchId = stdin.readLineSync()!;
        try {
          var s = students.firstWhere((st) => st.id == searchId);
          s.showFullDetail();
        } catch (e) {
          print("Không tìm thấy mã $searchId");
        }
        break;

      case "0":
        print("Đang thoát chương trình...");
        isRunning = false;
        break;

      default:
        print("Lựa chọn không hợp lệ!");
    }
  }
}