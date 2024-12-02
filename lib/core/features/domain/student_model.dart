// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  String firstName;
  String lastName;
  String email;
  int? greScore;
  int? toeflScore;
  String? preferredLocation;
  String phone;
  DateTime dateOfBirth;
  String password;

  StudentModel({
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
    String? firstName,
    String? lastName,
    String? email,
    int? greScore,
    int? toeflScore,
    String? preferredLocation,
    String? phone,
    DateTime? dateOfBirth,
    String? password,
  }) =>
      StudentModel(
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
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        greScore: json["gre_score"],
        toeflScore: json["toefl_score"],
        preferredLocation: json["preferred_location"],
        phone: json["phone"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gre_score": greScore,
        "toefl_score": toeflScore,
        "preferred_location": preferredLocation,
        "phone": phone,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "password": password,
      };
}
