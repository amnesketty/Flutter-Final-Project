import 'package:flutter/material.dart';
import 'package:lounga/app/pages/flight_booking/flight_detail_page.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_detail_page.dart';
import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_booking_page.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_detail_page.dart';
import 'package:lounga/app/pages/hotel_find/hotel_find_page.dart';
import 'package:lounga/app/pages/login/login_page.dart';
import 'package:lounga/app/pages/register/register_page.dart';

import '../domain/entities/hotel.dart';

class AppNavigator {
  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HotelDetailPage.route:
        final arguments = settings.arguments as Hotel;
        return MaterialPageRoute(
            builder: (BuildContext _) => HotelDetailPage(arguments));

      case FlightDetailPage.route:
        final arguments = settings.arguments as Flight;
        return MaterialPageRoute(
            builder: (BuildContext _) => FlightDetailPage(arguments));
      case FlightFindPage.route:
        final arguments = settings.arguments as List<Flight>;
        return MaterialPageRoute(
            builder: (BuildContext _) => FlightFindPage(arguments));
      case HotelBookingPage.route:
        final arguments = settings.arguments as Hotel;
        return MaterialPageRoute(
            builder: (BuildContext _) => HotelBookingPage(arguments));
      case HotelFindPage.route:
        final arguments = settings.arguments as List<Hotel>;
        return MaterialPageRoute(
            builder: (BuildContext _) => HotelFindPage(arguments));
      case LoginPage.route:
        return MaterialPageRoute(builder: (BuildContext _) => LoginPage());
      case RegisterPage.route:
        return MaterialPageRoute(builder: (BuildContext _) => RegisterPage());

      default:
        return null;
    }
  }
}
