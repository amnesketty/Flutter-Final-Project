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
      final bookingHotelId = await repository.bookingHotel(params!.bookingDate, params.totalRoom, params.price, params.hotelId, params.roomId);
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
  final int totalRoom;
  final int price;
  final int hotelId;
  final int roomId;
  HotelBookingParams(this.bookingDate, this.totalRoom, this.price, this.hotelId, this.roomId);
}