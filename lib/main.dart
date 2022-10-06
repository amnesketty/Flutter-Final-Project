import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:lounga/app/di/app_module.dart';
import 'package:lounga/app/navigator.dart';
import 'app/pages/login/login_page.dart';

void main() {
  AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appNavigator = Injector.appInstance.get<AppNavigator>();

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginPage(),
        onGenerateRoute: appNavigator.onGenerateRoutes);
  }
}
