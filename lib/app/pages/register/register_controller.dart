import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lounga/app/pages/register/register_presenter.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../widgets/pop_up_dialog.dart';
import '../login/login_page.dart';

class RegisterController extends Controller {
  final RegisterPresenter _presenter;

  RegisterController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int? _userId = 0;
  int? get userId => _userId;

  String? message;
  bool? status;

  bool _visibilityPassword = false;
  bool get visibilityPassword => _visibilityPassword;
  bool _visibilityConfirmPassword = false;
  bool get visibilityConfirmPassword => _visibilityConfirmPassword;

  final TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController get controllerFirstName => _controllerFirstName;
  final TextEditingController _controllerLastName = TextEditingController();
  TextEditingController get controllerLastName => _controllerLastName;
  final TextEditingController _controllerUsername = TextEditingController();
  TextEditingController get controllerUsername => _controllerUsername;
  final TextEditingController _controllerEmail = TextEditingController();
  TextEditingController get controllerEmail => _controllerEmail;
  final TextEditingController _controllerPhone = TextEditingController();
  TextEditingController get controllerPhone => _controllerPhone;
  final TextEditingController _controllerPassword = TextEditingController();
  TextEditingController get controllerPassword => _controllerPassword;
  final TextEditingController _controllerConfirmPassword = TextEditingController();
  TextEditingController get controllerConfirmPassword =>
      _controllerConfirmPassword;

  @override
  void initListeners() {
    _initObserver();
  }

  void _initObserver() {
    _presenter.onErrorUserLogin = (e) {
      _hideLoading();
      if (e is DioError) {
        message = e.response!.data['message'];
        status = e.response!.data['success'];
      }
    };
    _presenter.onFinishUserLogin = () {
      _hideLoading();
    };
    _presenter.onSuccessUserLogin = (int? data) {
      _userId = data;
    };
  }

  Future<void> registerNow(String firstName, String lastName, String username,
      String email, String phone, String password) async {
    _showLoading();
    _presenter.registerUser(
        firstName, lastName, username, email, phone, password);
    do {
      await Future.delayed(const Duration(milliseconds: 100));
    } while (_isLoading);
    if (status == false) {
      showDialog(
          context: getContext(),
          builder: (BuildContext context) => PopUpDialog(
              function: () {
                Navigator.pop(context);
              },
              message: "failed",
              tipePopUpDialog: message.toString(),
              popUpButton: "Unknown Error"));
      status = true;
    } else {
      showDialog(
          context: getContext(),
          builder: (BuildContext context) => PopUpDialog(
              function: () {
                navigateToLoginPage();
              },
              message: "success",
              tipePopUpDialog: "registerSuccess",
              popUpButton: "registerSuccess"));
    }
  }

  void showPassword() {
    _visibilityPassword = !_visibilityPassword;
    refreshUI();
  }

  void showConfirmPassword() {
    _visibilityConfirmPassword = !_visibilityConfirmPassword;
    refreshUI();
  }

  void navigateToLoginPage() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, LoginPage.route);
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
    _controllerFirstName.dispose();
    _controllerLastName.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPhone.dispose();
    _controllerPassword.dispose();
    _presenter.dispose();
  }
}
