import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/usecases/cases/passenger_add.dart';
import '../../../domain/entities/passenger.dart';
import '../../../domain/usecases/cases/flight_booking.dart';
import '../../../domain/usecases/cases/passenger_add_list.dart';

class FlightBookingPresenter extends Presenter {
  late Function(int?) onSuccessFlightBooking;
  late Function(dynamic error) onErrorFlightBooking;
  late Function() onFinishFlightBooking;

  late Function(int?) onSuccessPassengerAdd;
  late Function(dynamic error) onErrorPassengerAdd;
  late Function() onFinishPassengerAdd;

  late Function(bool?) onSuccessPassengerAddList;
  late Function(dynamic error) onErrorPassengerAddList;
  late Function() onFinishPassengerAddList;

  final FlightBooking flightBookingUseCase;
  final PassengerAdd passengerAddUseCase;
  final PassengerAddList passengerAddListUseCase;

  FlightBookingPresenter(
      {required this.flightBookingUseCase,
      required this.passengerAddUseCase,
      required this.passengerAddListUseCase});

  void flightBooking(
      String bookingDate,
      String destinationFrom,
      String destinationTo,
      int amountPassenger,
      int totalPrice,
      int flightId,
      String token) {
    flightBookingUseCase.execute(
        _FlightBookingObserver(this),
        FlightBookingParams(bookingDate, destinationFrom, destinationTo,
            amountPassenger, totalPrice, flightId, token));
  }

  void passengerAdd(String title, String name, String idCard,
      int bookingFlightId, String token) {
    passengerAddUseCase.execute(_PassengerAddObserver(this),
        PassengerAddParams(title, name, idCard, bookingFlightId, token));
  }

  void passengerAddList(List<SinglePassenger> listPassenger, String token) {
    passengerAddListUseCase.execute(_PassengerAddListObserver(this),
        PassengerAddListParams(listPassenger, token));
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

class _PassengerAddListObserver extends Observer<bool> {
  final FlightBookingPresenter presenter;

  _PassengerAddListObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onFinishPassengerAddList();
  }

  @override
  void onError(e) {
    presenter.onErrorPassengerAddList(e);
  }

  @override
  void onNext(bool? response) {
    bool? data = response;
    presenter.onSuccessPassengerAddList(data);
  }
}
