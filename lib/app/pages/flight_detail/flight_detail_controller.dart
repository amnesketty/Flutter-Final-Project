import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_page.dart';
import '../../../domain/entities/flight.dart';
import '../../../domain/entities/user.dart';
import '../flight_find/flight_find_controller.dart';

class FlightDetailController extends Controller {
  @override
  void initListeners() {}

  void navigateToFlightBooking(
      Flight flight,
      User user,
      String departureDate,
      int amountPassenger,
      int price,
      String destinationFrom,
      String destinationTo,
      String seatClass) {
    final context = getContext();
    Navigator.pushNamed(context, FlightBookingPage.route,
        arguments: FlightFindArgument(flight, user, departureDate,
            amountPassenger, price, destinationFrom, destinationTo, seatClass));
  }
}
