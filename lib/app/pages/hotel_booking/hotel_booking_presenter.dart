import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/usecases/cases/hotel_booking.dart';
import '../../../domain/usecases/cases/hotel_guest.dart';

class HotelBookingPresenter extends Presenter {
  late Function(int?) onSuccessHotelBooking;
  late Function(dynamic error) onErrorHotelBooking;
  late Function() onFinishHotelBooking;

  late Function(bool?) onSuccessHotelGuest;
  late Function(dynamic error) onErrorHotelGuest;
  late Function() onFinishHotelGuest;

  final HotelBooking hotelBookingUseCase;
  final HotelGuest hotelGuestUseCase;

  HotelBookingPresenter(
      {required this.hotelBookingUseCase, required this.hotelGuestUseCase});

  void hotelBooking(String bookingDate, String name, int totalRoom, int price,
      int hotelId, int roomId, String token) {
    hotelBookingUseCase.execute(
        _HotelBookingObserver(this),
        HotelBookingParams(
            bookingDate, name, totalRoom, price, hotelId, roomId, token));
  }

  void hotelGuest(String name, String email, String phone, int hotelBookingId,
      String token) {
    hotelGuestUseCase.execute(_HotelGuestObserver(this),
        HotelGuestParams(name, email, phone, hotelBookingId, token));
  }

  @override
  void dispose() {
    hotelBookingUseCase.dispose();
    hotelGuestUseCase.dispose();
  }
}

class _HotelBookingObserver extends Observer<int> {
  final HotelBookingPresenter presenter;

  _HotelBookingObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishHotelBooking();
  }

  @override
  void onError(e) {
    presenter.onErrorHotelBooking(e);
  }

  @override
  void onNext(int? response) {
    int? id = response;
    presenter.onSuccessHotelBooking(id);
  }
}

class _HotelGuestObserver extends Observer<bool> {
  final HotelBookingPresenter presenter;

  _HotelGuestObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishHotelGuest();
  }

  @override
  void onError(e) {
    presenter.onErrorHotelGuest(e);
  }

  @override
  void onNext(bool? response) {
    bool? success = response;
    presenter.onSuccessHotelGuest(success);
  }
}
