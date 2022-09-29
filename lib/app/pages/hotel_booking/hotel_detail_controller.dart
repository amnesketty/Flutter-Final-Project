// import 'package:lounga/app/pages/hotel_find/hotel_detail_presenter.dart';
import 'package:flutter/material.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'hotel_booking_page.dart';

class HotelDetailController extends Controller {
  
  @override
  void initListeners() {
  }

  void navigateToHotelBooking(Hotel hotel) {
    final context = getContext();
    Navigator.pushNamed(context, HotelBookingPage.route, arguments: hotel);
  }
}