import 'dart:convert';

class UserModel {
  UserModel({
    String? token,
  }) {
    _token = token;
  }

  UserModel.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
  UserModel copyWith({
    String? token,
  }) =>
      UserModel(
        token: token ?? _token,
      );
  String? get token => _token;

  Map<String, dynamic> toJson() {
    return {'token': _token};
  }

}