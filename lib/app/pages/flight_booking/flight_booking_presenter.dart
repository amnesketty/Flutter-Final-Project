import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/usecases/cases/flight_booking.dart';

class FlightBookingPresenter extends Presenter {
  late Function(int?) onSuccessFlightBooking;
  late Function(dynamic error) onErrorFlightBooking;
  late Function() onFinishFlightBooking;

  final FlightBooking flightBookingUseCase;

  FlightBookingPresenter({required this.flightBookingUseCase});

  void flightBooking(
      String bookingDate,
      String airline,
      String destinationFrom,
      String destinationTo,
      String departureTime,
      String arrivalTime,
      String seatClass,
      int flightId) {
    flightBookingUseCase.execute(
        _FlightBookingObserver(this),
        FlightBookingParams(bookingDate, airline, destinationFrom,
            destinationTo, departureTime, arrivalTime, seatClass, flightId));
  }

  @override
  void dispose() {
    flightBookingUseCase.dispose();
  }
}

class _FlightBookingObserver extends Observer<int> {
  final FlightBookingPresenter presenter;

  _FlightBookingObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishFlightBooking();
  }

  @override
  void onError(e) {
    presenter.onErrorFlightBooking(e);
  }

  @override
  void onNext(int? response) {
    int? user = response;
    presenter.onSuccessFlightBooking(user);
  }
}
