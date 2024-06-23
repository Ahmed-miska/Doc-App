import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  getit.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit<ApiService>()));
  getit.registerLazySingleton<LoginCubit>(() => LoginCubit(getit<LoginRepo>()));
}
