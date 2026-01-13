class Employee {
  String name;
  double baseSalary;
  int workingDays;

  Employee({
    required this.name,
    required this.baseSalary,
    required this.workingDays,
  });

  double calculateSalary() {
    return baseSalary * workingDays;
  }

  void addWorkingDays(int days) {
    if (days > 0) {
      workingDays += days;
      print('Da them $days ngay cong cho $name.');
    } else {
      print('Invalid number of days');
    }
  }

  @override
  String toString() {
    return 'Ten: $name | Luong CB: $baseSalary | Ngay cong: $workingDays | Tong luong: ${calculateSalary().toStringAsFixed(0)}';
  }
}