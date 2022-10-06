import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lounga/app/pages/login/login_presenter.dart';
import 'package:lounga/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../widgets/pop_up_dialog.dart';
import '../home/home_page.dart';
import '../register/register_page.dart';

class LoginController extends Controller {
  final LoginPresenter _presenter;

  LoginController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? _user = User(
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      token: "",
      avatarImage: "");
  User? get user => _user;

  String? message;

  bool _visibilityPassword = false;
  bool get visibilityPassword => _visibilityPassword;

  final TextEditingController _controllerUsername = TextEditingController();
  TextEditingController get controllerUsername => _controllerUsername;
  final TextEditingController _controllerPassword = TextEditingController();
  TextEditingController get controllerPassword => _controllerPassword;

  @override
  void initListeners() {
    _initObserver();
  }

  void _initObserver() {
    _presenter.onErrorUserLogin = (e) {
      _hideLoading();
      if (e is DioError) {
        message = e.response!.data['message'];
      }
    };
    _presenter.onFinishUserLogin = () {
      _hideLoading();
    };
    _presenter.onSuccessUserLogin = (User? data) {
      _user = data;
    };
  }

  Future<void> loginNow(String username, String password) async {
    _showLoading();
    _presenter.loginUser(username, password);
    do {
      await Future.delayed(const Duration(milliseconds: 100));
    } while (_isLoading);
    if (_user?.token != "") {
      final context = getContext();
      Navigator.pushNamed(context, HomePage.route, arguments: _user);
    } else {
      showDialog(
          context: getContext(),
          builder: (BuildContext context) => PopUpDialog(
              function: () {
                Navigator.pop(context);
              },
              message: "failed",
              tipePopUpDialog: message.toString(),
              popUpButton: "Unknown Error"));
    }
  }

  void navigateToHomePage() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, HomePage.route, arguments: _user);
  }

  void navigateToRegisterPage() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, RegisterPage.route);
  }

  void showPassword() {
    _visibilityPassword = !_visibilityPassword;
    refreshUI();
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
