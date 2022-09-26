import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/domain/usecases/cases/flight_get.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FlightGetPresenter extends Presenter {
  late Function(List<Flight>) onSuccessFlightGet;
  late Function(dynamic error) onErrorFlightGet;
  late Function() onFinishFlightGet;

  final FlightGet flightGetUseCase;

  FlightGetPresenter({required this.flightGetUseCase});

  void getFlight() {
    flightGetUseCase.execute(_FlightGetObserver(this));
  }

  @override
  void dispose() {
    flightGetUseCase.dispose();
  }
}

class _FlightGetObserver extends Observer<List<Flight>> {
  final FlightGetPresenter presenter;

  _FlightGetObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishFlightGet();
  }

  @override
  void onError(e) {
    presenter.onErrorFlightGet(e);
  }

  @override
  void onNext(List<Flight>? response) {
    List<Flight>? flights = response ?? [];
    presenter.onSuccessFlightGet(flights);
  }
}
