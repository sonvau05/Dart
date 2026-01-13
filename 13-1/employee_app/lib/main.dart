import 'dart:io';
import '../lib/employee.dart';

void main() {
  List<Employee> employees = [];

  stdout.write('Nhap so luong nhan vien (n): ');
  int n = int.parse(stdin.readLineSync() ?? '0');

  for (int i = 0; i < n; i++) {
    print('\n--- Nhap thong tin nhan vien thu ${i + 1} ---');
    
    stdout.write('Ten: ');
    String name = stdin.readLineSync()!;
    
    stdout.write('Luong co ban (baseSalary): ');
    double base = double.parse(stdin.readLineSync()!);
    
    stdout.write('So ngay lam viec (workingDays): ');
    int days = int.parse(stdin.readLineSync()!);

    employees.add(Employee(name: name, baseSalary: base, workingDays: days));
  }

  employees.sort((a, b) {
    double salaryA = a.calculateSalary();
    double salaryB = b.calculateSalary();
    return salaryB.compareTo(salaryA);
  });

  print('\n=== DANH SACH NHAN VIEN (GIAM DAN THEO LUONG) ===');
  for (var emp in employees) {
    print(emp.toString());
  }
}