import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

class LoginPage extends View {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final loginController = Injector.appInstance.get<LoginController>();
    return _LoginViewState(loginController);
  }
}

class _LoginViewState extends ViewState<LoginPage, LoginController> {
  _LoginViewState(super._controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('User'),
        ),
        body: ControlledWidgetBuilder<LoginController>(
            builder: (BuildContext _, LoginController controller) =>
                controller.isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : Center(
                        child: Text(controller.user!.token),
                      )),
      );
}
