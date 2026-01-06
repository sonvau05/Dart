class Student {
  final int? id;
  final String name;
  final String email;
  final int age;
  final bool isExpelled;
  final List<String> favoriteSubjects;

  Student({
    this.id,
    required this.name,
    required this.email,
    required this.age,
    this.isExpelled = false,
    this.favoriteSubjects = const [],
  });
}