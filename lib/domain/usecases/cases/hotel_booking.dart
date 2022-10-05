import 'dart:async';
import 'package:lounga/domain/repositories/hotel_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HotelBooking extends UseCase<int, HotelBookingParams> {
  final HotelRepository repository;

  HotelBooking(this.repository);

  @override
  Future<Stream<int>> buildUseCaseStream(HotelBookingParams? params) async {
    final streamController = StreamController<int>();

    try {
      final bookingHotelId = await repository.bookingHotel(params!.bookingDate, params.name, params.totalRoom, params.price, params.hotelId, params.roomId, params.token);
      streamController.add(bookingHotelId);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}

class HotelBookingParams {
  final String bookingDate;
  final String name;
  final int totalRoom;
  final int price;
  final int hotelId;
  final int roomId;
  final String token;
  HotelBookingParams(this.bookingDate, this.name, this.totalRoom, this.price, this.hotelId, this.roomId, this.token);
}