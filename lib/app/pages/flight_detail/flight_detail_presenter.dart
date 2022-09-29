import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/domain/usecases/cases/flight_detail.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FlightDetailPresenter extends Presenter {
  late Function(List<Flight>) onSuccessFlightDetail;
  late Function(dynamic error) onErrorFlightDetail;
  late Function() onFinishFlightDetail;

  final FlightDetail flightDetailUseCase;

  FlightDetailPresenter({required this.flightDetailUseCase});

  void detailFlight() {
    flightDetailUseCase.execute(_FlightDetailObserver(this));
  }

  @override
  void dispose() {
    flightDetailUseCase.dispose();
  }
}

class _FlightDetailObserver extends Observer<List<Flight>> {
  final FlightDetailPresenter presenter;

  _FlightDetailObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishFlightDetail();
  }

  @override
  void onError(e) {
    presenter.onErrorFlightDetail(e);
  }

  @override
  void onNext(List<Flight>? response) {
    List<Flight>? flights = response ?? [];
    presenter.onSuccessFlightDetail(flights);
  }
}
