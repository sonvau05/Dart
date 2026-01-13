class Student {
  final String name;
  final double tuitionFee;
  final List<double> otherFees;
  final double scholarship;

  Student({
    required this.name,
    required this.tuitionFee,
    required this.otherFees,
    required this.scholarship,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'tuitionFee': tuitionFee,
        'otherFees': otherFees,
        'scholarship': scholarship,
      };

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      tuitionFee: map['tuitionFee'],
      otherFees: List<double>.from(map['otherFees']),
      scholarship: map['scholarship'],
    );
  }
}