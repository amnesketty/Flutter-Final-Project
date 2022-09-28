import 'package:flutter/material.dart';
//import 'package:lounga/data/di/data_module.dart';
//import 'package:lounga/app/pages/login/login_page.dart';
import 'package:lounga/app/di/app_module.dart';
import 'package:lounga/app/pages/flight_find/flight_find_controller.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/app/pages/flight_get/flight_get_page.dart';
import 'app/pages/hotel_find/hotel_find_page.dart';

void main() {
  AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage(),
      //home: HotelGetPage(),
      home: FlightGetPage(),
    );
  }
}
