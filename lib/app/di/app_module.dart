import 'package:lounga/app/pages/login/login_controller.dart';
import 'package:lounga/app/pages/login/login_presenter.dart';
import 'package:lounga/domain/usecases/di/use_case_module.dart';
import 'package:lounga/data/di/data_module.dart';
import 'package:injector/injector.dart';

class AppModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerDependency<LoginPresenter>(
      () => LoginPresenter(userLoginUseCase: injector.get()),
    );
    injector.registerDependency<LoginController>(
      () => LoginController(injector.get()),
    );
  }

  static init() {
    DataModule.registerClasses();
    UseCaseModule.registerClasses();
    registerClasses();
  }
}