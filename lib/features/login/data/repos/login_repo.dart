import 'package:flutter_complete_project/core/networking/api_error_handler.dart';
import 'package:flutter_complete_project/core/networking/api_result.dart';
<<<<<<< HEAD
import 'package:flutter_complete_project/core/networking/api_service.dart';
=======
import 'package:flutter_complete_project/core/networking/api_services.dart';
>>>>>>> f02af74c77bc7683e9262a9d3a35e05ee136ee46
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
<<<<<<< HEAD
    } catch (error) {
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }
  
=======
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
>>>>>>> f02af74c77bc7683e9262a9d3a35e05ee136ee46
}





