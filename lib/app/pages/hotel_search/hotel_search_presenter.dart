import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/usecases/cases/hotel_find.dart';

class HotelSearchPresenter extends Presenter {
  late Function(List<Hotel>) onSuccessHotelSearch;
  late Function(dynamic error) onErrorHotelSearch;
  late Function() onFinishHotelSearch;

  final HotelFind hotelSearchUseCase;

  HotelSearchPresenter({required this.hotelSearchUseCase});

  void searchHotel(String city, String bookingDate, int totalRoom, int duration, String token) {
    hotelSearchUseCase.execute(
      _HotelSearchObserver(this), HotelFindParams(city, bookingDate, totalRoom, duration, token));
  }

  @override
  void dispose() {
    hotelSearchUseCase.dispose();
  }
}

class _HotelSearchObserver extends Observer<List<Hotel>> {
  final HotelSearchPresenter presenter;

  _HotelSearchObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishHotelSearch();
  }

  @override
  void onError(e) {
    presenter.onErrorHotelSearch(e);
  }

  @override
  void onNext(List<Hotel>? response) {
    List<Hotel>? hotels = response ?? [];
    presenter.onSuccessHotelSearch(hotels);
  }
}
