import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/hotel_booking/hotel_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

import '../../../domain/entities/hotel.dart';
import '../../widgets/hotel_tile.dart';
import 'hotel_booking_controller.dart';

class HotelBookingPage extends View {
  static const route = '/hotel-booking';

  final Hotel hotel;

  const HotelBookingPage(this.hotel, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final hotelBookingController =
        Injector.appInstance.get<HotelBookingController>();
    return _HotelBookingViewState(hotelBookingController);
  }
}

class _HotelBookingViewState
    extends ViewState<HotelBookingPage, HotelBookingController> {
  _HotelBookingViewState(super.controller);
  @override
  Widget get view => Scaffold(
      //key: globalKey,
      appBar: AppBar(
        backgroundColor: const Color(0XFFE67E22),
        centerTitle: true,
        title: Text(widget.hotel.name),
      ),
      backgroundColor: const Color(0XFFFFFFFF),
      body: Column(
      ));
}
