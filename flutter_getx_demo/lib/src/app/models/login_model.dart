
import 'dart:convert';

import 'login_data_model.dart';

class LoginModel {
  final bool? success;
  final List<LoginDataModel>? data;
  
  LoginModel({
    this.success,
    this.data,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      success: map['success'],
      data: map['data'] != null ? List<LoginDataModel>.from(map['data']?.map((x) => LoginDataModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source));
}
