// import 'package:lounga/app/pages/hotel_find/hotel_detail_presenter.dart';
import 'package:flutter/material.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/user.dart';
import '../hotel_booking/hotel_booking_page.dart';

class HotelDetailController extends Controller {
  
  @override
  void initListeners() {
  }

  void navigateToHotelBooking(Hotel hotel, User user, String bookingDate, int totalRoom,  int price, int roomId) {
    final context = getContext();
    Navigator.pushNamed(context, HotelBookingPage.route, arguments: HotelDetailArgument(hotel, user, bookingDate, totalRoom, price, roomId));
  }
}

class HotelDetailArgument {
  Hotel hotel;
  User user;
  String bookingDate;
  int totalRoom;
  int price;
  int roomId;
  HotelDetailArgument(this.hotel, this.user, this.bookingDate, this.totalRoom, this.price, this.roomId);
}