import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/domain/usecases/cases/flight_find.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FlightFindPresenter extends Presenter {
  late Function(List<Flight>) onSuccessFlightFind;
  late Function(dynamic error) onErrorFlightFind;
  late Function() onFinishFlightFind;

  final FlightFind flightFindUseCase;

  FlightFindPresenter({required this.flightFindUseCase});

  void findFlight() {
    flightFindUseCase.execute(_FlightFindObserver(this));
  }

  @override
  void dispose() {
    flightFindUseCase.dispose();
  }
}

class _FlightFindObserver extends Observer<List<Flight>> {
  final FlightFindPresenter presenter;

  _FlightFindObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishFlightFind();
  }

  @override
  void onError(e) {
    presenter.onErrorFlightFind(e);
  }

  @override
  void onNext(List<Flight>? response) {
    List<Flight>? flights = response ?? [];
    presenter.onSuccessFlightFind(flights);
  }
}
