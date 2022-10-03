import 'dart:async';
import 'package:lounga/domain/repositories/hotel_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/usecases/cases/hotel_booking.dart';

import '../../entities/hotel_bookings.dart';


class HotelGuest extends UseCase<bool, HotelGuestParams> {
  final HotelRepository repository;
  final HotelBookings hotelBooking;

  HotelGuest(this.repository, this.hotelBooking);

  @override
  Future<Stream<bool>> buildUseCaseStream(HotelGuestParams? params) async {
    final streamController = StreamController<bool>();

    try {
      final bookingHotelId = await hotelBooking.id;
      final hotelGuest = await repository.addGuest(params!.name, params.email, params.phone, bookingHotelId);
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
  final int hotelBookingId;
  HotelGuestParams(this.name, this.email, this.phone, this.hotelBookingId);
}