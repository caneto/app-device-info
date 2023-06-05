import 'dart:convert';

class LoginDataModel {
  final String user;
  final String password;
  
  LoginDataModel({
    this.user = '',
    this.password = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'password': password,
    };
  }

  factory LoginDataModel.fromMap(Map<String, dynamic> map) {
    return LoginDataModel(
      user: map['user'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDataModel.fromJson(String source) => LoginDataModel.fromMap(json.decode(source));
}
