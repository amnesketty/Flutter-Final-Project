import 'dart:async';
// import 'package:lounga/data/repositories/data_hotel_repository.dart';
import 'package:lounga/domain/repositories/hotel_repository.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HotelFind extends UseCase<List<Hotel>, HotelFindParams> {
  final HotelRepository repository;

  HotelFind(this.repository);

  @override
  Future<Stream<List<Hotel>>> buildUseCaseStream(HotelFindParams? params) async {
    final streamController = StreamController<List<Hotel>>();

    try {
      final hotel = await repository.findHotel(params!.city, params.bookingDate, params.totalRoom, params.duration);
      streamController.add(hotel);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}

class HotelFindParams {
  final String city;
  final String bookingDate;
  final int totalRoom;
  final int duration;
  final String token;
  HotelFindParams(this.city, this.bookingDate, this.totalRoom, this.duration, this.token);
}