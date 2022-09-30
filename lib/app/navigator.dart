


import 'package:flutter/material.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_booking_page.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_detail_page.dart';
import 'package:lounga/app/pages/hotel_find/hotel_find_page.dart';

import '../domain/entities/hotel.dart';

class AppNavigator {
  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HotelDetailPage.route:
        final arguments = settings.arguments as Hotel;
        return MaterialPageRoute(
          builder: (BuildContext _) => HotelDetailPage(arguments));
      case HotelBookingPage.route:
        final arguments = settings.arguments as Hotel;
        return MaterialPageRoute(
          builder: (BuildContext _) => HotelBookingPage(arguments));
      case HotelFindPage.route:
        final arguments = settings.arguments as List<Hotel>;
        return MaterialPageRoute(
          builder: (BuildContext _) => HotelFindPage(arguments));
      default: 
        return null;
    }
  }
}