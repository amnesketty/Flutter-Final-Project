import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/entities/flight.dart';
import '../../../data/repositories/flight_repositories.dart';

class GetFlights extends UseCase<List<Flight>, dynamic> {
  final FlightRepository repository;

  GetFlights(this.repository);

  @override
  Future<Stream<List<Flight>?>> buildUseCaseStream(params) async {
    final Controller = StreamController<List<Flight>>();

    try {
      final flights = await repository.flights();
      Controller.add(flights);
      Controller.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      Controller.addError(e, stackTrace);
    }

    return Controller.stream;
  }
}
