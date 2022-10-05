import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/usecases/cases/passenger_add.dart';
import '../../../domain/usecases/cases/flight_booking.dart';

class FlightBookingPresenter extends Presenter {
  late Function(int?) onSuccessFlightBooking;
  late Function(dynamic error) onErrorFlightBooking;
  late Function() onFinishFlightBooking;

  late Function(int?) onSuccessPassengerAdd;
  late Function(dynamic error) onErrorPassengerAdd;
  late Function() onFinishPassengerAdd;

  final FlightBooking flightBookingUseCase;
  final PassengerAdd passengerAddUseCase;

  FlightBookingPresenter({required this.flightBookingUseCase, required this.passengerAddUseCase});


  void flightBooking(
      String bookingDate,
      String destinationFrom,
      String destinationTo,
      int amountPassenger,
      int totalPrice,
      int flightId, String token) {
    flightBookingUseCase.execute(
        _FlightBookingObserver(this),
        FlightBookingParams(bookingDate, destinationFrom, destinationTo, amountPassenger,totalPrice, flightId,token));
  }

  void passengerAdd(
      String title, String name, String idCard, int bookingFlightId, String token) {
    passengerAddUseCase.execute(_PassengerAddObserver(this),
        PassengerAddParams(title, name, idCard, bookingFlightId, token));
  }

  @override
  void dispose() {
    flightBookingUseCase.dispose();
    passengerAddUseCase.dispose();
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
    int? data = response;
    presenter.onSuccessFlightBooking(data);
  }
}

class _PassengerAddObserver extends Observer<int> {
  final FlightBookingPresenter presenter;

  _PassengerAddObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishPassengerAdd();
  }

  @override
  void onError(e) {
    presenter.onErrorPassengerAdd(e);
  }

  @override
  void onNext(int? response) {
    int? data = response;
    presenter.onSuccessPassengerAdd(data);
  }
}
