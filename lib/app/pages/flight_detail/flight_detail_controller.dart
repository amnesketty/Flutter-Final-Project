import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_page.dart';

import '../../../domain/entities/flight.dart';
import '../../../domain/entities/user.dart';

class FlightDetailController extends Controller {
  @override
  void initListeners() {}

  void navigateToFlightBooking(Flight flight) {
    final context = getContext();
    Navigator.pushNamed(context, FlightBookingPage.route, arguments: flight);
  }
}

class FlightsArgument {
  List<Flight> flights;
  User user;
  String departureDate;
  FlightsArgument(this.flights, this.user, this.departureDate);
}
