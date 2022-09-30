import 'package:lounga/domain/entities/flight.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/usecases/cases/flight_find.dart';

class FlightSearchPresenter extends Presenter {
  late Function(List<Flight>) onSuccessFlightSearch;
  late Function(dynamic error) onErrorFlightSearch;
  late Function() onFinishFlightSearch;

  final FlightFind flightSearchUseCase;

  FlightSearchPresenter({required this.flightSearchUseCase});

  void searchFlight(String seatClass, String destinationFrom,
      String destinationTo, String departureDate, int amountPassenger) {
    flightSearchUseCase.execute(
        _FlightSearchObserver(this),
        FlightFindParams(seatClass, destinationFrom, destinationTo,
            departureDate, amountPassenger));
  }

  @override
  void dispose() {
    flightSearchUseCase.dispose();
  }
}

class _FlightSearchObserver extends Observer<List<Flight>> {
  final FlightSearchPresenter presenter;

  _FlightSearchObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishFlightSearch();
  }

  @override
  void onError(e) {
    presenter.onErrorFlightSearch(e);
  }

  @override
  void onNext(List<Flight>? response) {
    List<Flight>? flights = response ?? [];
    presenter.onSuccessFlightSearch(flights);
  }
}
