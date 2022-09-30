import 'package:lounga/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:lounga/app/widgets/text_field.dart';

class LoginPage extends View {
  static const route = '/login-page';

  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final loginController = Injector.appInstance.get<LoginController>();
    return _LoginViewState(loginController);
  }
}

class _LoginViewState extends ViewState<LoginPage, LoginController> {
  _LoginViewState(super.controller);

  @override
  Widget get view => Scaffold(
        backgroundColor: Colors.black,
        key: globalKey,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ControlledWidgetBuilder<LoginController>(
            builder: (BuildContext context, LoginController controller) => 
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Image(image: AssetImage('assets/images/logo-lounga.png'), alignment: Alignment.topLeft,),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Text('Username', style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldCustome(textEditingController: controller.controllerUsername, textLabel: 'Username'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),                
                    const Text('Password', style: TextStyle(color: Colors.white, fontSize: 18),),                
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldCustome(textEditingController: controller.controllerPassword, textLabel: 'Password'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {                        
                            controller.loginNow(controller.controllerUsername.text, controller.controllerPassword.text);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            backgroundColor: const Color(0XFFE67E22)
                          ),
                          child: const Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize: 20),)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Doesn't have an account? ", style: TextStyle(color: Colors.white),),
                        TextButton(onPressed: () {
                          controller.navigateToRegisterPage();
                        }, child: const Text("SIGN UP", style: TextStyle(color: Colors.white),))
                      ],
                    ),
                  ],
                ),
                controller.isLoading ? 
                Container(
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2)
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFFE67E22),
                    ),))
                : const SizedBox()
              ]
            ),
          ),
        ),
      );
}
