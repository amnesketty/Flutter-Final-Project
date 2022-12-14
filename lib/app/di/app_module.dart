import 'package:lounga/app/pages/flight_detail/flight_detail_controller.dart';
import 'package:lounga/app/pages/home/home_presenter.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_presenter.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_booking_presenter.dart';
import 'package:lounga/app/pages/hotel_search/hotel_search_controller.dart';
import 'package:lounga/app/pages/hotel_search/hotel_search_presenter.dart';
import 'package:lounga/app/pages/register/register_controller.dart';
import 'package:lounga/app/pages/register/register_presenter.dart';
import 'package:lounga/app/navigator.dart';
import 'package:lounga/app/pages/hotel_detail/hotel_detail_controller.dart';
import 'package:lounga/domain/usecases/di/use_case_module.dart';
import 'package:lounga/data/di/data_module.dart';
import 'package:injector/injector.dart';

import 'package:lounga/app/pages/login/login_controller.dart';
import 'package:lounga/app/pages/login/login_presenter.dart';

import '../pages/flight_booking/flight_booking_controller.dart';
import '../pages/flight_find/flight_find_controller.dart';
import '../pages/flight_find/flight_find_presenter.dart';
import '../pages/flight_get/flight_get_controller.dart';
import '../pages/flight_get/flight_get_presenter.dart';

import '../pages/home/home_controller.dart';
import '../pages/hotel_booking/hotel_booking_controller.dart';
import '../pages/flight_search/flight_search_controller.dart';
import '../pages/flight_search/flight_search_presenter.dart';
import '../pages/hotel_find/hotel_find_controller.dart';
import '../pages/hotel_find/hotel_find_presenter.dart';
import 'package:lounga/app/pages/hotel_get/hotel_get_controller.dart';
import 'package:lounga/app/pages/hotel_get/hotel_get_presenter.dart';

class AppModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    //USER
    injector.registerDependency<LoginPresenter>(
        () => LoginPresenter(userLoginUseCase: injector.get()));
    injector.registerDependency<LoginController>(
        () => LoginController(injector.get()));
    injector.registerDependency<RegisterPresenter>(
        () => RegisterPresenter(userRegisterUsecase: injector.get()));
    injector.registerDependency<RegisterController>(
        () => RegisterController(injector.get()));
    injector.registerDependency<HomeController>(
        () => HomeController(injector.get()));
    injector.registerDependency<HomePresenter>(
        () => HomePresenter(userTransactionCase: injector.get()));

    //FLIGHT
    injector.registerDependency<FlightGetPresenter>(
        () => FlightGetPresenter(flightGetUseCase: injector.get()));
    injector.registerDependency<FlightGetController>(
        () => FlightGetController(injector.get()));
    injector.registerDependency<FlightSearchPresenter>(
        () => FlightSearchPresenter(flightSearchUseCase: injector.get()));
    injector.registerDependency<FlightSearchController>(
        () => FlightSearchController(injector.get()));
    injector.registerDependency<FlightFindPresenter>(
        () => FlightFindPresenter(flightFindUseCase: injector.get()));
    injector.registerDependency<FlightFindController>(
        () => FlightFindController(injector.get()));
    injector.registerDependency<FlightDetailController>(
        () => FlightDetailController());
    injector.registerDependency<FlightBookingController>(
        () => FlightBookingController(injector.get()));
    injector.registerDependency<FlightBookingPresenter>(() =>
        FlightBookingPresenter(
            flightBookingUseCase: injector.get(),
            passengerAddUseCase: injector.get(),
            passengerAddListUseCase: injector.get()));

    //HOTEL
    injector.registerDependency<HotelGetPresenter>(
        () => HotelGetPresenter(hotelGetUseCase: injector.get()));
    injector.registerDependency<HotelGetController>(
        () => HotelGetController(injector.get()));
    injector.registerDependency<HotelSearchPresenter>(
        () => HotelSearchPresenter(hotelSearchUseCase: injector.get()));
    injector.registerDependency<HotelSearchController>(
        () => HotelSearchController(injector.get()));
    injector.registerDependency<HotelFindPresenter>(
        () => HotelFindPresenter(hotelFindUseCase: injector.get()));
    injector.registerDependency<HotelFindController>(
        () => HotelFindController(injector.get()));
    injector.registerDependency<HotelDetailController>(
        () => HotelDetailController());
    injector.registerDependency<HotelBookingController>(
        () => HotelBookingController(injector.get()));
    injector.registerDependency<HotelBookingPresenter>(() =>
        HotelBookingPresenter(
            hotelBookingUseCase: injector.get(),
            hotelGuestUseCase: injector.get()));

    injector.registerSingleton<AppNavigator>(() => AppNavigator());
  }

  static init() {
    DataModule.registerClasses();
    UseCaseModule.registerClasses();
    registerClasses();
  }
}
