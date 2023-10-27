// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String id;
  String user;
  String email;
  String phone;
  String password;
  String token;
  String hide;
  DateTime date;

  User({
    required this.id,
    required this.user,
    required this.email,
    required this.phone,
    required this.password,
    required this.token,
    required this.hide,
    required this.date,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        user: json["user"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        token: json["token"],
        hide: json["user_hide"],
        date: DateTime.parse(json["user_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "email": email,
        "phone": phone,
        "password": password,
        "token": token,
        "user_hide": hide,
        "user_date": date.toIso8601String(),
      };
}
