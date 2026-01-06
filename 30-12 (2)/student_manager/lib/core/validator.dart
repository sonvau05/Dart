class StudentValidator {
  static String? validate(String email, int age, List<String> existingEmails) {
    if (age <= 18) return "Lỗi: Tuổi phải lớn hơn 18.";
    if (existingEmails.contains(email)) return "Lỗi: Email đã tồn tại.";
    return null;
  }
}