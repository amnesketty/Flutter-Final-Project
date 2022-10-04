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
          params.amountPassenger,
          params.totalPrice,
          params.flightId,
          params.token);
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
  final int amountPassenger;
  final int totalPrice;
  final int flightId;
  final String token;
  FlightBookingParams(
      this.bookingDate, this.amountPassenger, this.totalPrice, this.flightId, this.token);
}
