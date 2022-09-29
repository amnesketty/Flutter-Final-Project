import 'package:lounga/app/navigator.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_detail_controller.dart';
import 'package:lounga/domain/usecases/di/use_case_module.dart';
import 'package:lounga/data/di/data_module.dart';
import 'package:injector/injector.dart';

import 'package:lounga/app/pages/login/login_controller.dart';
import 'package:lounga/app/pages/login/login_presenter.dart';

import '../pages/flight_find/flight_find_controller.dart';
import '../pages/flight_find/flight_find_presenter.dart';
import '../pages/flight_get/flight_get_controller.dart';
import '../pages/flight_get/flight_get_presenter.dart';

import '../pages/hotel_find/hotel_find_controller.dart';
import '../pages/hotel_find/hotel_find_presenter.dart';
import 'package:lounga/app/pages/hotel_get/hotel_get_controller.dart';
import 'package:lounga/app/pages/hotel_get/hotel_get_presenter.dart';

class AppModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerDependency<LoginPresenter>(
      () => LoginPresenter(userLoginUseCase: injector.get()));
    injector.registerDependency<LoginController>(
      () => LoginController(injector.get()));

    injector.registerDependency<FlightGetPresenter>(
      () => FlightGetPresenter(flightGetUseCase: injector.get()));
    injector.registerDependency<FlightGetController>(
      () => FlightGetController(injector.get()));
    injector.registerDependency<FlightFindPresenter>(
      () => FlightFindPresenter(flightFindUseCase: injector.get()));
    injector.registerDependency<FlightFindController>(
      () => FlightFindController(injector.get()));
    
    injector.registerDependency<HotelGetPresenter>(
      () => HotelGetPresenter(hotelGetUseCase: injector.get()));
    injector.registerDependency<HotelGetController>(
        () => HotelGetController(injector.get()));
    injector.registerDependency<HotelFindPresenter>(
      () => HotelFindPresenter(hotelFindUseCase: injector.get()));
    injector.registerDependency<HotelFindController>(
        () => HotelFindController(injector.get()));
    injector.registerDependency<HotelDetailController>(
      () => HotelDetailController());

    injector.registerSingleton<AppNavigator>(() => AppNavigator());

  }

  static init() {
    DataModule.registerClasses();
    UseCaseModule.registerClasses();
    registerClasses();
  }
}
