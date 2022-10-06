import 'dart:async';
import 'package:lounga/domain/repositories/hotel_repository.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HotelGet extends UseCase<List<Hotel>, dynamic> {
  final HotelRepository repository;

  HotelGet(this.repository);

  @override
  Future<Stream<List<Hotel>>> buildUseCaseStream(params) async {
    final streamController = StreamController<List<Hotel>>();
    try {
      final hotel = await repository.getHotel("jakarta");
      streamController.add(hotel);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }
    return streamController.stream;
  }
}
