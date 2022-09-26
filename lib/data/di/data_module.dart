import 'package:lounga/data/misc/constants.dart';
import 'package:lounga/data/misc/endpoints.dart';
import 'package:lounga/data/repositories/data_hotel_repository.dart';
import 'package:lounga/data/repositories/data_users_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injector/injector.dart';
import 'package:lounga/domain/repositories/hotel_repository.dart';
import 'package:lounga/domain/repositories/users_repository.dart';


import '../repositories/data_find_hotel_repository.dart';

class DataModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerSingleton<Endpoints>(() => Endpoints());
    injector.registerDependency<Dio>(() {
      final dio = Dio();
      dio.options.baseUrl = baseUrl;
      dio.options.sendTimeout = 30 * 1000;
      dio.options.connectTimeout = 30 * 1000;
      dio.options.receiveTimeout = 30 * 1000;

      return dio;
    });
    injector.registerDependency<UserRepository>(
      () => DataUserRepository(endpoints: injector.get(), dio: injector.get()));

    injector.registerDependency<HotelRepository>(
      () => DataHotelRepository(endpoints: injector.get(), dio: injector.get()));

    injector.registerDependency<FindHotelRepository>(
      () => DataFindHotelRepository(endpoints: injector.get(), dio: injector.get()));

  }
}
