import 'package:lounga/domain/usecases/cases/flight_find.dart';
import 'package:lounga/domain/usecases/cases/flight_get.dart';
import 'package:lounga/domain/usecases/cases/user_login.dart';
import 'package:injector/injector.dart';

class UseCaseModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerDependency<UserLogin>(() => UserLogin(injector.get()));
    injector.registerDependency<FlightGet>(() => FlightGet(injector.get()));
    injector.registerDependency<FlightFind>(() => FlightFind(injector.get()));
  }
}
