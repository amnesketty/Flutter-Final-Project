import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/flight.dart';
import 'flight_booking_page.dart';

class FlightDetailController extends Controller {
  @override
  void initListeners() {}

  void navigateToFlightBooking(Flight flight) {
  final context = getContext();
  Navigator.pushNamed(context, FlightBookingPage.route, arguments: flight);
  }
}
