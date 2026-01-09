import '../lib/math_service.dart';

void main() async {
  double so1 = 10;
  double so2 = 5;
  String phepTinh = '+';

  print('Bat dau chuong trinh...');
  print('Dang thuc hien phep tinh $so1 $phepTinh $so2 ... (Vui long doi)');

  try {
    double ketQua = await calculateAsync(so1, so2, phepTinh);
    print('Ket qua la: $ketQua');
  } catch (e) {
    print(e);
  }

  print('Ket thuc chuong trinh.');
}