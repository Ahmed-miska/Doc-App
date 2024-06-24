<<<<<<< HEAD

=======
>>>>>>> f02af74c77bc7683e9262a9d3a35e05ee136ee46
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
<<<<<<< HEAD
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error({required String error}) = Error;

=======

  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error({required String error}) = Error;
>>>>>>> f02af74c77bc7683e9262a9d3a35e05ee136ee46
}
