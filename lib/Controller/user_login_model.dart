import 'dart:convert';

Userlogin userloginFromJson(String str) => Userlogin.fromJson(json.decode(str));

String userloginToJson(Userlogin data) => json.encode(data.toJson());

class Userlogin {
  int status;
  String userId;
  String otp;

  Userlogin({
    required this.status,
    required this.userId,
    required this.otp,
  });

  factory Userlogin.fromJson(Map<String, dynamic> json) => Userlogin(
        status: json["status"],
        userId: json["userId"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "userId": userId,
        "otp": otp,
      };
}
