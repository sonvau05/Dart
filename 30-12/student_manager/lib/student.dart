class Student {
  final int? id;
  final String idCard; 
  final String name;

  Student({this.id, required this.idCard, required this.name});

  @override
  String toString() => 'MSSV: $idCard | Tên: $name';
}