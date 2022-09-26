import 'package:lounga/domain/entities/hotel.dart';
import 'package:lounga/domain/usecases/cases/hotel_get.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HotelGetPresenter extends Presenter {
  late Function(List<Hotel>) onSuccessHotelGet;
  late Function(dynamic error) onErrorHotelGet;
  late Function() onFinishHotelGet;

  final HotelGet hotelGetUseCase;

  HotelGetPresenter({required this.hotelGetUseCase});

  void getHotel() {
    hotelGetUseCase.execute(_HotelGetObserver(this));
  }

  @override
  void dispose() {
    hotelGetUseCase.dispose();
  }

}

class _HotelGetObserver extends Observer<List<Hotel>> {
  final HotelGetPresenter presenter;

  _HotelGetObserver(this.presenter);
  
  @override
  void onComplete() {
    presenter.onFinishHotelGet();
  }
  
  @override
  void onError(e) {
    presenter.onErrorHotelGet(e);
  }
  
  @override
  void onNext(List<Hotel>? response) {
    List<Hotel> hotels = response ?? [];
    presenter.onSuccessHotelGet(hotels);
  }
}