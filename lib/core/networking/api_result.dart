<<<<<<< HEAD

import 'package:flutter_complete_project/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';
=======
import 'package:flutter_complete_project/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

>>>>>>> f02af74c77bc7683e9262a9d3a35e05ee136ee46
@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}
