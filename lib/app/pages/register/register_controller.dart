import 'package:flutter/material.dart';
import 'package:lounga/app/pages/register/register_presenter.dart';
import 'package:lounga/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegisterController extends Controller {
  final RegisterPresenter _presenter;

  RegisterController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int? _userId = 0;
  int? get userId => _userId;
  
  bool _visibilityPassword = false;
  bool get visibilityPassword => _visibilityPassword;
  bool _visibilityConfirmPassword = false;
  bool get visibilityConfirmPassword => _visibilityConfirmPassword;

  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController get controllerFirstName => _controllerFirstName;
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController get controllerLastName => _controllerLastName;
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController get controllerUsername => _controllerUsername;
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController get controllerPhone => _controllerPhone;
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController get controllerPassword => _controllerPassword;
  TextEditingController _controllerConfirmPassword = TextEditingController();
  TextEditingController get controllerConfirmPassword => _controllerConfirmPassword;

  @override
  void initListeners() {
    _initObserver();
  }

  // void _registerUser(String firstName, String lastName, String username, String email, String phone, String password) {
  //   _showLoading();
  //   _presenter.registerUser(firstName, lastName, username, email, phone, password);
  // }

  void _initObserver() {
    _presenter.onErrorUserLogin = (e) {
      _hideLoading();
    };
    _presenter.onFinishUserLogin = () {
      _hideLoading();
    };
    _presenter.onSuccessUserLogin = (int? data) {
      _userId = data;
    };
  }

  void registerNow(String firstName, String lastName, String username, String email, String phone, String password) {
    _showLoading();
    _presenter.registerUser(firstName, lastName, username, email, phone, password);
  }

  void showPassword() {
    _visibilityPassword = !_visibilityPassword;
    refreshUI();
  }
  void showConfirmPassword() {
    _visibilityConfirmPassword = !_visibilityConfirmPassword;
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
    _controllerFirstName.dispose();
    _controllerLastName.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPhone.dispose();
    _controllerPassword.dispose();
    _presenter.dispose();
  }
}
