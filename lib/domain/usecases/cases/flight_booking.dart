import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../repositories/flights_repository.dart';

class FlightBooking extends UseCase<int, FlightBookingParams> {
  final FlightRepository repository;

  FlightBooking(this.repository);

  @override
  Future<Stream<int>> buildUseCaseStream(FlightBookingParams? params) async {
    final streamController = StreamController<int>();

    try {
      final bookingFlightId = await repository.bookingFlight(
          params!.bookingDate,
          params.airline,
          params.destinationFrom,
          params.destinationTo,
          params.departureTime,
          params.arrivalTime,
          params.seatClass,
          params.flightId);
      streamController.add(bookingFlightId);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}

class FlightBookingParams {
  final String bookingDate;
  final String airline;
  final String destinationFrom;
  final String destinationTo;
  final String departureTime;
  final String arrivalTime;
  final String seatClass;
  final int flightId;
  FlightBookingParams(
      this.bookingDate,
      this.airline,
      this.destinationFrom,
      this.destinationTo,
      this.departureTime,
      this.arrivalTime,
      this.seatClass,
      this.flightId);
}
