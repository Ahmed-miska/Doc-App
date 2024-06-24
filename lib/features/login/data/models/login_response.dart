<<<<<<< HEAD

import 'package:json_annotation/json_annotation.dart';

=======
import 'package:json_annotation/json_annotation.dart';
>>>>>>> f02af74c77bc7683e9262a9d3a35e05ee136ee46
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  LoginResponse({this.message, this.userData, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
<<<<<<< HEAD
 @JsonKey(name: 'username')
=======
  @JsonKey(name: 'username')
>>>>>>> f02af74c77bc7683e9262a9d3a35e05ee136ee46
  String? userName;

  UserData({this.token, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
