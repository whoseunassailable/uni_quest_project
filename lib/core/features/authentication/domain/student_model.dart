class StudentModel {
  String? studentId; // Make studentId optional by making it nullable
  String firstName;
  String lastName;
  String email;
  int? greScore;
  int? toeflScore;
  String? preferredLocation;
  String phone;
  String dateOfBirth;
  String password;

  StudentModel({
    this.studentId, // Optional parameter
    required this.firstName,
    required this.lastName,
    required this.email,
    this.greScore,
    this.toeflScore,
    this.preferredLocation,
    required this.phone,
    required this.dateOfBirth,
    required this.password,
  });

  StudentModel copyWith({
    String? studentId,
    String? firstName,
    String? lastName,
    String? email,
    int? greScore,
    int? toeflScore,
    String? preferredLocation,
    String? phone,
    String? dateOfBirth,
    String? password,
  }) =>
      StudentModel(
        studentId: studentId ?? this.studentId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        greScore: greScore ?? this.greScore,
        toeflScore: toeflScore ?? this.toeflScore,
        preferredLocation: preferredLocation ?? this.preferredLocation,
        phone: phone ?? this.phone,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        password: password ?? this.password,
      );

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        studentId: json["student_id"]
            ?.toString(), // Handle potentially missing or null value
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        greScore: json["gre_score"],
        toeflScore: json["toefl_score"],
        preferredLocation: json["preferred_location"],
        phone: json["phone"] ?? "",
        dateOfBirth: json["date_of_birth"] ?? "",
        password: json["password"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        if (studentId != null) "student_id": studentId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gre_score": greScore,
        "toefl_score": toeflScore,
        "preferred_location": preferredLocation,
        "phone": phone,
        "date_of_birth": dateOfBirth,
        "password": password,
      };
}
