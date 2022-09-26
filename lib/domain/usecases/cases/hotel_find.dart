import 'dart:async';
// import 'package:lounga/data/repositories/data_hotel_repository.dart';
import 'package:lounga/domain/repositories/hotel_repository.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HotelFind extends UseCase<List<Hotel>, dynamic> {
  final HotelRepository repository;

  HotelFind(this.repository);

  @override
  Future<Stream<List<Hotel>>> buildUseCaseStream(params) async {
    final streamController = StreamController<List<Hotel>>();

    try {
      final hotel = await repository.findHotel("jakarta", "2022-09-25T08:07:31.773Z", 1, 1);
      streamController.add(hotel);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}