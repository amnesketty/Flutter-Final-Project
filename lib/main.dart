import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
//import 'package:lounga/data/di/data_module.dart';
//import 'package:lounga/app/pages/login/login_page.dart';
import 'package:lounga/app/di/app_module.dart';
import 'package:lounga/app/navigator.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_page.dart';
import 'package:lounga/app/pages/flight_booking/flight_detail_page.dart';
import 'package:lounga/app/pages/flight_find/flight_find_controller.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/app/pages/flight_get/flight_get_page.dart';
import 'package:lounga/app/pages/home/home_page.dart';
import 'app/pages/flight_search/flight_search_page.dart';
import 'app/pages/hotel_find/hotel_find_page.dart';
import 'app/pages/hotel_search/hotel_search_page.dart';
import 'app/pages/login/login_page.dart';
import 'app/pages/register/register_page.dart';

void main() {
  AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appNavigator = Injector.appInstance.get<AppNavigator>();

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: LoginPage(),
        //home: HotelGetPage(),
        // ignore: prefer_const_constructors
        // home: FlightBookingPage(),
        onGenerateRoute: appNavigator.onGenerateRoutes);
  }
}
