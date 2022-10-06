import 'dart:async';
import 'package:lounga/domain/entities/passenger.dart';
import 'package:lounga/domain/repositories/flights_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PassengerAddList extends UseCase<bool, PassengerAddListParams> {
  final FlightRepository repository;

  PassengerAddList(this.repository);

  @override
  Future<Stream<bool>> buildUseCaseStream(PassengerAddListParams? params) async {
    final streamController = StreamController<bool>();

    try {
      final listPassenger = await repository.addListPassenger(
          params!.listPassenger, params.token);
      streamController.add(listPassenger);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}

class PassengerAddListParams {
  final List<SinglePassenger> listPassenger;
  final String token;
  PassengerAddListParams(
      this.listPassenger, this.token);
}
