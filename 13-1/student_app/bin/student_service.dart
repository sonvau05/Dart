import 'student_model.dart';

class StudentService {
  static bool isValid(Student s) {
    if (s.scholarship < 0) return false;
    return s.otherFees.every((fee) => fee <= s.tuitionFee);
  }

  static double calculateNetTuition(Student s) {
    if (!isValid(s)) return 0.0;
    double totalOther = s.otherFees.fold(0, (sum, item) => sum + item);
    return s.tuitionFee - s.scholarship + totalOther;
  }

  static double calculateTax(double net) {
    if (net > 15000) return net * 0.10;
    if (net >= 7000) return net * 0.05;
    return net * 0.02;
  }
}