


import 'package:flutter/material.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_detail_page.dart';

import '../domain/entities/hotel.dart';

class AppNavigator {
  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HotelDetailPage.route:
        final arguments = settings.arguments as Hotel;
        return MaterialPageRoute(
          builder: (BuildContext _) => HotelDetailPage(arguments));
      default: 
        return null;
    }
  }
}