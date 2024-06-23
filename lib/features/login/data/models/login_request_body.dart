import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
<<<<<<< HEAD

class LoginRequestBody {
  final String email;
  final String password;
  
  LoginRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);


}
=======
class LoginRequestBody {
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
>>>>>>> f02af74c77bc7683e9262a9d3a35e05ee136ee46
