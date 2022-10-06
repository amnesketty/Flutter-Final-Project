import 'package:lounga/app/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:lounga/app/widgets/pop_up_dialog.dart';
import 'package:lounga/app/widgets/text_field.dart';
import '../../widgets/text_field_password.dart';

class RegisterPage extends View {
  static const route = '/register-page';

  RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final registerController = Injector.appInstance.get<RegisterController>();
    return _RegisterViewState(registerController);
  }
}

class _RegisterViewState extends ViewState<RegisterPage, RegisterController> {
  _RegisterViewState(super.controller);

  @override
  Widget get view => Scaffold(
        backgroundColor: Colors.black,
        key: globalKey,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ControlledWidgetBuilder<RegisterController>(
            builder: (BuildContext context, RegisterController controller) =>
              Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Image(image: AssetImage('assets/images/logo-lounga.png'), alignment: Alignment.topLeft,),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Text('First Name', style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldCustome(textEditingController: controller.controllerFirstName, textLabel: 'First Name'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Text('Last Name', style: TextStyle(color: Colors.white, fontSize: 18),),                
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldCustome(textEditingController: controller.controllerLastName, textLabel: 'Last Name'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Text('Username', style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldCustome(textEditingController: controller.controllerUsername, textLabel: 'Username'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Text('Email', style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldCustome(textEditingController: controller.controllerEmail, textLabel: 'Email'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Text('Phone', style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldCustome(textEditingController: controller.controllerPhone, textLabel: 'Phone'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    const Text('Password', style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldPassword(textEditingController: controller.controllerPassword, textLabel: 'Password', visible: controller.visibilityPassword, refresh: () => controller.showPassword(),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Text('Confirm Password', style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFieldPassword(textEditingController: controller.controllerConfirmPassword, textLabel: 'Confirm Password', visible: controller.visibilityConfirmPassword, refresh: () => controller.showConfirmPassword(),),                    
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () async {                        
                            controller.registerNow(
                              controller.controllerFirstName.text,
                              controller.controllerLastName.text,
                              controller.controllerUsername.text,
                              controller.controllerEmail.text,
                              controller.controllerPhone.text, 
                              controller.controllerPassword.text);
                            do {
                              await Future.delayed(const Duration(milliseconds: 100));
                            } while (controller.isLoading);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => 
                                  PopUpDialog(function: () {controller.navigateToLoginPage();}, message: "success", tipePopUpDialog: "registerSuccess", popUpButton: "registerSuccess")
                              );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            backgroundColor: const Color(0XFFE67E22)
                          ),
                          child: const Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 20),)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? ", style: TextStyle(color: Colors.white),),
                        TextButton(onPressed: (){                        
                          controller.navigateToLoginPage();
                        }, child: const Text("SIGN IN", style: TextStyle(color: Colors.white),))
                      ],
                    ),
                  ],
                ),
                controller.isLoading ? 
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2)
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFFE67E22),
                    ),))
                : const SizedBox()
              ]
            ) 
          ),
        ),
      );
}