import 'dart:async';

Future<double> calculateAsync(double a, double b, String operator) async {
  await Future.delayed(Duration(seconds: 1));

  switch (operator) {
    case '+':
      return a + b;
    case '-':
      return a - b;
    case '*':
      return a * b;
    case '/':
      if (b == 0) {
        throw Exception('Loi: Khong the chia cho 0');
      }
      return a / b;
    default:
      throw Exception('Loi: Phep tinh khong hop le');
  }
}