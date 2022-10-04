import 'dart:async';
import 'package:lounga/domain/repositories/hotel_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/usecases/cases/hotel_booking.dart';

import '../../entities/hotel_bookings.dart';


class HotelGuest extends UseCase<bool, HotelGuestParams> {
  final HotelRepository repository;

  HotelGuest(this.repository);

  @override
  Future<Stream<bool>> buildUseCaseStream(HotelGuestParams? params) async {
    final streamController = StreamController<bool>();

    try {
      final hotelGuest = await repository.addGuest(params!.name, params.email, params.phone, params.bookingHotelId);
      streamController.add(hotelGuest);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}

class HotelGuestParams {
  final String name;
  final String email;
  final String phone;
  final int bookingHotelId;
  HotelGuestParams(this.name, this.email, this.phone, this.bookingHotelId);
}