import 'package:lounga/domain/entities/hotel.dart';
import 'package:lounga/domain/usecases/cases/hotel_find.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HotelFindPresenter extends Presenter {
  late Function(List<Hotel>) onSuccessHotelFind;
  late Function(dynamic error) onErrorHotelFind;
  late Function() onFinishHotelFind;

  final HotelFind hotelFindUseCase;

  HotelFindPresenter({required this.hotelFindUseCase});

  @override
  void dispose() {
    hotelFindUseCase.dispose();
  }
}

class _HotelFindObserver extends Observer<List<Hotel>> {
  final HotelFindPresenter presenter;

  _HotelFindObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishHotelFind();
  }

  @override
  void onError(e) {
    presenter.onErrorHotelFind(e);
  }

  @override
  void onNext(List<Hotel>? response) {
    List<Hotel> hotels = response ?? [];
    presenter.onSuccessHotelFind(hotels);
  }
}
