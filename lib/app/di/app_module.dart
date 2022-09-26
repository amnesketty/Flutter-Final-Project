import 'package:lounga/app/pages/login/login_controller.dart';
import 'package:lounga/app/pages/login/login_presenter.dart';
import 'package:lounga/domain/usecases/di/use_case_module.dart';
import 'package:lounga/data/di/data_module.dart';
import 'package:injector/injector.dart';
import '../pages/flight_find/flight_find_controller.dart';
import '../pages/flight_find/flight_find_presenter.dart';
import '../pages/flight_get/flight_get_controller.dart';
import '../pages/flight_get/flight_get_presenter.dart';

class AppModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerDependency<LoginPresenter>(
      () => LoginPresenter(userLoginUseCase: injector.get()),
    );
    injector.registerDependency<LoginController>(
      () => LoginController(injector.get()),
    );
    injector.registerDependency<FlightGetPresenter>(
      () => FlightGetPresenter(flightGetUseCase: injector.get()),
    );
    injector.registerDependency<FlightGetController>(
      () => FlightGetController(injector.get()),
    );
    injector.registerDependency<FlightFindPresenter>(
      () => FlightFindPresenter(flightFindUseCase: injector.get()),
    );
    injector.registerDependency<FlightFindController>(
      () => FlightFindController(injector.get()),
    );
  }

  static init() {
    DataModule.registerClasses();
    UseCaseModule.registerClasses();
    registerClasses();
  }
}
