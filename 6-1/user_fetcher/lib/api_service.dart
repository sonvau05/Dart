import 'dart:async';

Future<Map<String, dynamic>> fetchUserById(int id) {
  return Future.delayed(Duration(seconds: 1), () {
    if (id == 101) {
      return {
        'id': 101,
        'name': 'User101',
        'age': 20
      };
    } else {
      throw Exception('Lỗi: Không tìm thấy người dùng với ID $id');
    }
  });
}