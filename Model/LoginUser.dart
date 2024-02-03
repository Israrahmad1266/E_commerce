/// status : 404
/// message : "user not found ! not registered"

class LoginUser {
  LoginUser({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  LoginUser.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
LoginUser copyWith({  num? status,
  String? message,
}) => LoginUser(  status: status ?? _status,
  message: message ?? _message,
);
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}