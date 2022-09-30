import 'dart:async';
import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/domain/repositories/flights_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FlightFind extends UseCase<List<Flight>, FlightFindParams> {
  final FlightRepository repository;

  FlightFind(this.repository);

  @override
  Future<Stream<List<Flight>>> buildUseCaseStream(
      FlightFindParams? params) async {
    final streamController = StreamController<List<Flight>>();

    try {
      final flight = await repository.findFlight(
          params!.seatClass,
          params.destinationFrom,
          params.destinationTo,
          params.departureDate,
          params.amountPassengers);
      streamController.add(flight);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}

class FlightFindParams {
  final String seatClass;
  final String destinationFrom;
  final String destinationTo;
  final String departureDate;
  final int amountPassengers;
  FlightFindParams(this.seatClass, this.destinationFrom, this.destinationTo,
      this.departureDate, this.amountPassengers);
}
