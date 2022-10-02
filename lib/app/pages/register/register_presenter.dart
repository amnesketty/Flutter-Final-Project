import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/usecases/cases/user_register.dart';

class RegisterPresenter extends Presenter {
  late Function(int?) onSuccessUserLogin;
  late Function(dynamic error) onErrorUserLogin;
  late Function() onFinishUserLogin;
  
  final UserRegister userRegisterUsecase;

  RegisterPresenter({required this.userRegisterUsecase});

  void registerUser(String firstName, String lastName, String username, String email, String phone, String password) {
    userRegisterUsecase.execute(_UserRegisterObserver(this), UserRegisterParams(firstName, lastName, username, email, phone, password));
  }

  @override
  void dispose() {
    userRegisterUsecase.dispose();
  }
}

class _UserRegisterObserver extends Observer<int> {
  final RegisterPresenter presenter;

  _UserRegisterObserver(this.presenter);
  
  @override
  void onComplete() {
    presenter.onFinishUserLogin();
  }
  
  @override
  void onError(e) {
    presenter.onErrorUserLogin(e);
  }
  
  @override
  void onNext(int? response) {
    int? user = response;
    presenter.onSuccessUserLogin(user);
  }
}