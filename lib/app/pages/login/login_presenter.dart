import 'package:lounga/domain/entities/user.dart';
import 'package:lounga/domain/usecases/cases/user_login.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPresenter extends Presenter {
  late Function(User?) onSuccessUserLogin;
  late Function(dynamic error) onErrorUserLogin;
  late Function() onFinishUserLogin;

  final UserLogin userLoginUseCase;

  LoginPresenter({required this.userLoginUseCase});

  void loginUser(String username, String password) {
    userLoginUseCase.execute(_UserLoginObserver(this), UserLoginParams(username, password));
  }

  @override
  void dispose() {
    userLoginUseCase.dispose();
  }
}

class _UserLoginObserver extends Observer<User> {
  final LoginPresenter presenter;

  _UserLoginObserver(this.presenter);
  
  @override
  void onComplete() {
    presenter.onFinishUserLogin();
  }
  
  @override
  void onError(e) {
    presenter.onErrorUserLogin(e);
  }
  
  @override
  void onNext(User? response) {
    User? user = response;
    presenter.onSuccessUserLogin(user);
  }
}