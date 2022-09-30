import 'package:flutter/material.dart';
import 'package:lounga/app/pages/login/login_presenter.dart';
import 'package:lounga/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../register/register_page.dart';

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

  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController get controllerUsername => _controllerUsername;
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController get controllerPassword => _controllerPassword;

  @override
  void initListeners() {
    _initObserver();
    //_loginUser();
  }

  // void _loginUser(String username, String password) {
  //   _showLoading();
  //   _presenter.loginUser(username, password);
  // }

  void _initObserver() {
    _presenter.onErrorUserLogin = (e) {
      _hideLoading();
    };
    _presenter.onFinishUserLogin = () {
      _hideLoading();
    };
    _presenter.onSuccessUserLogin = (User? data) {
      _user = data;
    };
  }

  void loginNow(String username, String password) {
    //_initObserver();
    _showLoading();
    _presenter.loginUser(username, password);
    //_loginUser(username, password);
  }

  void navigateToRegisterPage() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, RegisterPage.route);
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
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    _presenter.dispose();
  }
}
