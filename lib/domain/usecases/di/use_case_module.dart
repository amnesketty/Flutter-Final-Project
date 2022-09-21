import 'package:lounga/domain/usecases/cases/user_login.dart';
import 'package:injector/injector.dart';

class UseCaseModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerDependency<UserLogin>(() => UserLogin(injector.get()));
  }
}