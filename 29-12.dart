import 'dart:io';

void main() {
  bool isRunning = true;

  while (isRunning) {
    print("\n--- MENU PHÉP TÍNH ---");
    print("1. Cộng");
    print("2. Trừ");
    print("3. Nhân");
    print("4. Chia");
    print("5. Thoát");
    stdout.write("Chọn phép tính (1-5): ");
    
    String? choice = stdin.readLineSync();

    if (choice == "5") {
      print("Đang thoát chương trình...");
      isRunning = false;
      break;
    }

    stdout.write("Nhập số thứ nhất: ");
    double num1 = double.parse(stdin.readLineSync()!);
    stdout.write("Nhập số thứ hai: ");
    double num2 = double.parse(stdin.readLineSync()!);

    switch (choice) {
      case "1":
        print("Kết quả Cộng: ${num1 + num2}");
        break;
      case "2":
        print("Kết quả Trừ: ${num1 - num2}");
        break;
      case "3":
        print("Kết quả Nhân: ${num1 * num2}");
        break;
      case "4":
        if (num2 != 0) {
          print("Kết quả Chia: ${num1 / num2}");
        } else {
          print("Lỗi: Không thể chia cho 0!");
        }
        break;
      default:
        print("Lựa chọn không hợp lệ!");
    }
  }
}