import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/usecases/cases/hotel_booking.dart';
import '../../../domain/usecases/cases/user_register.dart';

class HotelBookingPresenter extends Presenter {
  late Function(int?) onSuccessHotelBooking;
  late Function(dynamic error) onErrorHotelBooking;
  late Function() onFinishHotelBooking;

  final HotelBooking hotelBookingUseCase;

  HotelBookingPresenter({required this.hotelBookingUseCase});

  void hotelBooking(String bookingDate, int totalRoom, int price, int hotelId, int roomId) {
    hotelBookingUseCase.execute(_HotelBookingObserver(this), HotelBookingParams(bookingDate, totalRoom, price, hotelId, roomId));
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
    int? user = response;
    presenter.onSuccessHotelBooking(user);
  }
}