import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _prefs;

  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._ctor();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._ctor();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // static setAuthToken(String token) async {
  //   return _prefs.setString(UserPref.AuthToken.toString(), token);
  // }
  static Future<void> setAuthToken(String token) async {
    await _prefs.setString(UserPref.AuthToken.toString(), token);
  }

  static String getAuthToken() {
    return _prefs.getString(UserPref.AuthToken.toString()) ?? "";
  }

  static String getUserId() {
    return _prefs.getString(UserPref.UserID.toString()) ?? "";
  }

  static setUserId(String id) {
    return _prefs.setString(UserPref.UserID.toString(), id.toString());
  }

  static setUserImage(String? img) {
    return _prefs.setString(UserPref.UserImage.toString(), img.toString());
  }

  static String getUserImage() {
    return _prefs.getString(UserPref.UserImage.toString()) ?? "";
  }

  static setUserName(String uname) {
    return _prefs.setString(UserPref.UserName.toString(), uname);
  }

  static String? getUserName() {
    return _prefs.getString(UserPref.UserName.toString());
  }

  static setUserMail(String mail) {
    return _prefs.setString(UserPref.UserMail.toString(), mail);
  }

  static String? getUserMail() {
    return _prefs.getString(UserPref.UserMail.toString());
  }

  static setUserPhone(String phone) {
    return _prefs.setString(UserPref.UserPhone.toString(), phone);
  }

  static String? getUserPhone() {
    return _prefs.getString(UserPref.UserPhone.toString());
  }

  static setUserGender(String? gender) {
    return _prefs.setString(UserPref.UserGender.toString(), '$gender');
  }

  static String? getUserGender() {
    return _prefs.getString(UserPref.UserGender.toString());
  }

  static void setLoggIn(bool value) {
    _prefs.setBool('loggin', value);
  }

  static bool getLoggIn() {
    return _prefs.getBool('loggin') ?? false;
  }

// ! location set
//   static void setLocation(String value) {
//     _prefs.setString('location', value);
//   }
//
//   static String getLocation() {
//     return _prefs.getString('location') ?? "kolkata";
//   }
}

enum UserPref {
  AuthToken,
  UserName,
  UserID,
  UserImage,
  UserMail,
  UserPhone,
  UserGender
}
