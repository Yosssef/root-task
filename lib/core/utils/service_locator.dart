import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/core/utils/api_service.dart';
import 'package:untitled/features/home/data/rops/home_repo_imp.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(
    ApiService(
      Dio(),
    ),
  ));

// Alternatively you could write it if you don't like global variables
}
