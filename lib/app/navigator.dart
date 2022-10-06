import 'package:flutter/material.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_page.dart';
import 'package:lounga/app/pages/flight_detail/flight_detail_page.dart';
import 'package:lounga/app/pages/flight_find/flight_find_controller.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/app/pages/flight_search/flight_search_controller.dart';
import 'package:lounga/app/pages/flight_search/flight_search_page.dart';
import 'package:lounga/app/pages/home/home_page.dart';
import 'package:lounga/app/pages/hotel_detail/hotel_detail_controller.dart';
import 'package:lounga/app/pages/hotel_detail/hotel_detail_page.dart';
import 'package:lounga/app/pages/hotel_find/hotel_find_controller.dart';
import 'package:lounga/app/pages/hotel_search/hotel_search_controller.dart';
import 'package:lounga/app/pages/hotel_search/hotel_search_page.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_booking_page.dart';
import 'package:lounga/app/pages/hotel_find/hotel_find_page.dart';
import 'package:lounga/app/pages/login/login_page.dart';
import 'package:lounga/app/pages/register/register_page.dart';
import '../domain/entities/user.dart';

class AppNavigator {
  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      //AUTHENTICATION
      case RegisterPage.route:
        return MaterialPageRoute(builder: (BuildContext _) => RegisterPage());
      case LoginPage.route:
        return MaterialPageRoute(builder: (BuildContext _) => LoginPage());
      case HomePage.route:
        final arguments = settings.arguments as User;
        return MaterialPageRoute(
            builder: (BuildContext _) => HomePage(arguments));

      //HOTEL SERVICE
      case HotelSearchPage.route:
        final arguments = settings.arguments as User;
        return MaterialPageRoute(
            builder: (BuildContext _) => HotelSearchPage(arguments));
      case HotelFindPage.route:
        final arguments = settings.arguments as HotelsArgument;
        return MaterialPageRoute(
            builder: (BuildContext _) => HotelFindPage(arguments.hotels,
                arguments.user, arguments.bookingDate, arguments.totalRoom));
      case HotelDetailPage.route:
        final arguments = settings.arguments as HotelFindArgument;
        return MaterialPageRoute(
            builder: (BuildContext _) => HotelDetailPage(arguments.hotel,
                arguments.user, arguments.bookingDate, arguments.totalRoom));
      case HotelBookingPage.route:
        final arguments = settings.arguments as HotelDetailArgument;
        return MaterialPageRoute(
            builder: (BuildContext _) => HotelBookingPage(
                arguments.hotel,
                arguments.user,
                arguments.bookingDate,
                arguments.totalRoom,
                arguments.roomsHotel));

      //FLIGHT SERVICE
      case FlightSearchPage.route:
        final arguments = settings.arguments as User;
        return MaterialPageRoute(
            builder: (BuildContext _) => FlightSearchPage(arguments));
      case FlightFindPage.route:
        final arguments = settings.arguments as FlightsArgument;
        return MaterialPageRoute(
            builder: (BuildContext _) => FlightFindPage(
                arguments.flights,
                arguments.user,
                arguments.departureDate,
                arguments.amountPassenger,
                arguments.destinationFrom,
                arguments.destinationTo,
                arguments.seatClass));
      case FlightDetailPage.route:
        final arguments = settings.arguments as FlightFindArgument;
        return MaterialPageRoute(
            builder: (BuildContext _) => FlightDetailPage(
                arguments.flight,
                arguments.user,
                arguments.departureDate,
                arguments.amountPassenger,
                arguments.price,
                arguments.destinationFrom,
                arguments.destinationTo,
                arguments.seatClass));
      case FlightBookingPage.route:
        final arguments = settings.arguments as FlightFindArgument;
        return MaterialPageRoute(
            builder: (BuildContext _) => FlightBookingPage(
                arguments.flight,
                arguments.user,
                arguments.departureDate,
                arguments.amountPassenger,
                arguments.price));

      default:
        return null;
    }
  }
}
