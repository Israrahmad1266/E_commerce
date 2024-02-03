import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  Data? data;
  String? accessToken;

  UserProfile({
    this.data,
    this.accessToken,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "accessToken": accessToken,
      };
}

class Data {
  CurrentLocation currentLocation;
  String id;
  String fullName;
  String phone;
  String email;
  String password;
  bool accountVerification;
  bool shopOpen;
  String userType;
  int numOfReviews;
  int wallet;
  int bonus;
  int floatingCash;
  bool isAdminVerify;
  List<dynamic> reviews;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String image;
  String otp;
  DateTime otpExpiration;

  Data({
    required this.currentLocation,
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
    required this.accountVerification,
    required this.shopOpen,
    required this.userType,
    required this.numOfReviews,
    required this.wallet,
    required this.bonus,
    required this.floatingCash,
    required this.isAdminVerify,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.image,
    required this.otp,
    required this.otpExpiration,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentLocation: CurrentLocation.fromJson(json["currentLocation"]),
        id: json["_id"] ?? "",
        fullName: json["fullName"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        accountVerification: json["accountVerification"] ?? false,
        shopOpen: json["shopOpen"] ?? false,
        userType: json["userType"] ?? "",
        numOfReviews: json["numOfReviews"] ?? 0,
        wallet: json["wallet"] ?? 0,
        bonus: json["bonus"] ?? 0,
        floatingCash: json["floatingCash"] ?? 0,
        isAdminVerify: json["isAdminVerify"] ?? false,
        reviews: List<dynamic>.from(json["reviews"] ?? []),
        createdAt: DateTime.parse(json["createdAt"] ?? ""),
        updatedAt: DateTime.parse(json["updatedAt"] ?? ""),
        v: json["__v"] ?? 0,
        image: json["image"] ?? "",
        otp: json["otp"] ?? "",
        otpExpiration: DateTime.parse(json["otpExpiration"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "currentLocation": currentLocation.toJson(),
        "_id": id,
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "password": password,
        "accountVerification": accountVerification,
        "shopOpen": shopOpen,
        "userType": userType,
        "numOfReviews": numOfReviews,
        "wallet": wallet,
        "bonus": bonus,
        "floatingCash": floatingCash,
        "isAdminVerify": isAdminVerify,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "image": image,
        "otp": otp,
        "otpExpiration": otpExpiration.toIso8601String(),
      };
}

class CurrentLocation {
  String type;
  List<int> coordinates;

  CurrentLocation({
    required this.type,
    required this.coordinates,
  });

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      CurrentLocation(
        type: json["type"] ?? "",
        coordinates: List<int>.from(json["coordinates"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
