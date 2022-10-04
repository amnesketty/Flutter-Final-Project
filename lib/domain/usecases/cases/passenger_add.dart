import 'dart:async';
import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/domain/entities/passenger.dart';
import 'package:lounga/domain/repositories/flights_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PassengerAdd extends UseCase<int, PassengerAddParams> {
  final FlightRepository repository;

  PassengerAdd(this.repository);

  @override
  Future<Stream<int>> buildUseCaseStream(PassengerAddParams? params) async {
    final streamController = StreamController<int>();

    try {
      final passenger = await repository.addPassenger(
          params!.title, params.name, params.idCard, params.bookingFlightId, params.token);
      streamController.add(passenger);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}

class PassengerAddParams {
  final String title;
  final String name;
  final String idCard;
  final int bookingFlightId;
  final String token;
  PassengerAddParams(
      this.title, this.name, this.idCard, this.bookingFlightId, this.token);
}
