import 'dart:convert';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginUserToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
  final String email;
  final String password;

  LoginUser({
    required this.email,
    required this.password,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
