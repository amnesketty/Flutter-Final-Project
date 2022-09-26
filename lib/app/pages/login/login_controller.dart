import 'package:lounga/app/pages/login/login_presenter.dart';
import 'package:lounga/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginController extends Controller {
  final LoginPresenter _presenter;

  LoginController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? _user = User(
      firstName: "test",
      lastName: "test",
      email: "test",
      phone: "test",
      token: "test");
  User? get user => _user;

  @override
  void initListeners() {
    _initObserver();
    _loginUser();
  }

  void _loginUser() {
    _showLoading();
    _presenter.loginUser();
  }

  void _initObserver() {
    _presenter.onErrorUserLogin = (e) {};
    _presenter.onFinishUserLogin = () {
      _hideLoading();
    };
    _presenter.onSuccessUserLogin = (User? data) {
      _user = data;
    };
  }

  void _showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void _hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _presenter.dispose();
  }
}
