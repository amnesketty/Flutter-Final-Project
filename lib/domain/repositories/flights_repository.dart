import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/domain/entities/passenger.dart';

abstract class FlightRepository {
  Future<List<Flight>> getAllFlight();

  Future<List<Flight>> findFlight(
      String seatClass,
      String destinationFrom,
      String destinationTo,
      String departureDate,
      int amountPassengers,
      String token);

  Future<int> bookingFlight(
      String bookingDate,
      String destinationFrom,
      String destinationTo,
      int amountPassenger,
      int totalPrice,
      int flightId,
      String token);

  Future<int> addPassenger(String title, String name, String idCard,
      int bookingFlightId, String token);

  Future<bool> addListPassenger(
      List<SinglePassenger> listPassenger, String token);
}
