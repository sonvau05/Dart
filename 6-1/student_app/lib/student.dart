class Student {
  String id;
  String fName;
  String lName;
  String birthday;
  String phone;
  String email;

  Student(this.id, this.fName, this.lName, this.birthday, this.phone, this.email);

  @override
  String toString() {
    return 'ID: $id | Tên: $fName $lName | Email: $email';
  }
}