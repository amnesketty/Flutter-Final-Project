import 'dart:async';
import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/domain/repositories/flights_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FlightFind extends UseCase<List<Flight>, dynamic> {
  final FlightRepository repository;

  FlightFind(this.repository);

  @override
  Future<Stream<List<Flight>>> buildUseCaseStream(params) async {
    final streamController = StreamController<List<Flight>>();

    try {
      final flight = await repository.findFlight("Economy", "Yogyakarta (YIA)",
          "Medan (KNO)", "2022-09-14T04:58:38.715Z");
      streamController.add(flight);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}
