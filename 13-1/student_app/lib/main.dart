import '../lib/student_model.dart';
import '../lib/student_service.dart';

void main() {
  final student = Student(
    name: "Nguyen Van A",
    tuitionFee: 10000,
    otherFees: [200, 300],
    scholarship: 1000,
  );

  if (StudentService.isValid(student)) {
    double net = StudentService.calculateNetTuition(student);
    double tax = StudentService.calculateTax(net);

    print('Sinh vien: ${student.name}');
    print('Hoc phi thuc: $net');
    print('Thue phai nop: $tax');
  } else {
    print('Invalid Input!');
  }
}