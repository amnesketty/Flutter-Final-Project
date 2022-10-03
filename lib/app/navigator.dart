import 'package:flutter/material.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_page.dart';
import 'package:lounga/app/pages/flight_find/flight_find_controller.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/app/pages/flight_search/flight_search_controller.dart';
import 'package:lounga/app/pages/flight_search/flight_search_page.dart';
import 'package:lounga/app/pages/home/home_page.dart';
<<<<<<< HEAD
import 'package:lounga/app/pages/hotel_booking/hotel_detail_page.dart';
=======
import 'package:lounga/app/pages/hotel_detail/hotel_detail_page.dart';
import 'package:lounga/app/pages/hotel_search/hotel_search_page.dart';
import 'package:lounga/domain/entities/flight.dart';
>>>>>>> ce0843fcb8d251a9e34209c47c4f751d00b173f2
import 'package:lounga/app/pages/hotel_booking/hotel_booking_page.dart';
import 'package:lounga/app/pages/hotel_find/hotel_find_page.dart';
import 'package:lounga/app/pages/login/login_page.dart';
import 'package:lounga/app/pages/register/register_page.dart';

import '../domain/entities/hotel.dart';
import '../domain/entities/user.dart';

class AppNavigator {
  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HotelDetailPage.route:
        final arguments = settings.arguments as Hotel;
        return MaterialPageRoute(
            builder: (BuildContext _) => HotelDetailPage(arguments));
      case FlightFindPage.route:
        final arguments = settings.arguments as FlightsArgument;
        return MaterialPageRoute(
            builder: (BuildContext _) =>
                FlightFindPage(arguments.flights, arguments.user, arguments.departureDate));
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
      case HomePage.route:
        final arguments = settings.arguments as User;
        return MaterialPageRoute(
            builder: (BuildContext _) => HomePage(arguments));
      case FlightSearchPage.route:
        final arguments = settings.arguments as User;
        return MaterialPageRoute(
            builder: (BuildContext _) => FlightSearchPage(arguments));
      case FlightBookingPage.route:
        final arguments = settings.arguments as FlightFindArgument;
        return MaterialPageRoute(
            builder: (BuildContext _) => FlightBookingPage(arguments.flight, arguments.user, arguments.departureDate));

      default:
        return null;
    }
  }
}
