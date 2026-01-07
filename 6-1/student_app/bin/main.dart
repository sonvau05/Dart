import '../lib/student.dart';

Future<Student> getInformation() {
  print('--> Đang kết nối server lấy thông tin...');
  
  // Giả vờ đợi 2 giây (mô phỏng độ trễ mạng)
  return Future.delayed(Duration(seconds: 2), () {
    // Trả về dữ liệu sau 2 giây
    return Student('SV01', 'Nguyen', 'Van A', '01/01/2004', '0909123456', 'a@gmail.com');
  });
}

void main() {
  print('Bắt đầu chương trình');

  getInformation().then((student) {
    print('\n--> Đã tải xong!');
    print(student.toString());
  }).catchError((error) {
    print('Lỗi: $error');
  });

  print('Lệnh này chạy ngay lập tức (không bị chặn bởi Future)');
}