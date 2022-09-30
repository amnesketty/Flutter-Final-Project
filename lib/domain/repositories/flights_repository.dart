import 'package:lounga/domain/entities/flight.dart';

abstract class FlightRepository {
  Future<List<Flight>> getAllFlight();

  Future<List<Flight>> findFlight(String seatClass, String destinationFrom,
      String destinationTo, String departureDate, int amountPassengers);
}
