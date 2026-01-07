import '../lib/api_service.dart';

void main() {
  List<int> userIds = [101, 102, 103];

  print('--- BẮT ĐẦU QUÁ TRÌNH LẤY DỮ LIỆU ---');

  for (int id in userIds) {
    fetchUserById(id).then((user) {
      print('Thành công -> User ID: ${user['id']}, Name: ${user['name']}, Age: ${user['age']}');
    }).catchError((error) {
      print('Thất bại   -> $error');
    });
  }

  print('Yêu cầu đã được gửi, vui lòng đợi trong giây lát...');
}