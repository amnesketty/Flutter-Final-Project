import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/usecases/cases/hotel_booking.dart';
import '../../../domain/usecases/cases/hotel_guest.dart';
import '../../../domain/usecases/cases/user_register.dart';

class HotelBookingPresenter extends Presenter {
  late Function(int?) onSuccessHotelBooking;
  late Function(dynamic error) onErrorHotelBooking;
  late Function() onFinishHotelBooking;

  late Function(bool?) onSuccessHotelGuest;
  late Function(dynamic error) onErrorHotelGuest;
  late Function() onFinishHotelGuest;

  final HotelBooking hotelBookingUseCase;
  final HotelGuest hotelGuestUseCase;

  HotelBookingPresenter({required this.hotelBookingUseCase, required this.hotelGuestUseCase});

  void hotelBooking(String bookingDate, int totalRoom, int price, int hotelId, int roomId) {
    hotelBookingUseCase.execute(_HotelBookingObserver(this), HotelBookingParams(bookingDate, totalRoom, price, hotelId, roomId));
  }

  void hotelGuest(String name, String email, String phone, int hotelBookingId) {
    hotelGuestUseCase.execute(_HotelGuestObserver(this), HotelGuestParams(name, email, phone, hotelBookingId));
  }

  @override
  void dispose() {
    hotelBookingUseCase.dispose();
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