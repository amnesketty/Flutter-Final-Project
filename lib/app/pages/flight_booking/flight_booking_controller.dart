import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_presenter.dart';
import 'package:lounga/app/pages/flight_search/flight_search_page.dart';
import 'package:lounga/domain/entities/passenger.dart';
import 'package:lounga/domain/entities/user.dart';

import '../../../domain/entities/flight.dart';
import '../flight_search/flight_search_controller.dart';
import '../home/home_page.dart';

class FlightBookingController extends Controller {
  final FlightBookingPresenter _presenter;

  FlightBookingController(this._presenter);

  int _valueDropdownTitle = 1;
  int get valueDropdownTitle => _valueDropdownTitle;

  late User _user;

  int? _bookingFlightId;
  int? get bookingFlightId => _bookingFlightId;

  List<Passenger> _passengers = [];
  List<Passenger> get passengers => _passengers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _controllerTitle = TextEditingController();
  TextEditingController get controllerTitle => _controllerTitle;
  final TextEditingController _controllerName = TextEditingController();
  TextEditingController get controllerName => _controllerName;
  final TextEditingController _controllerIdCard = TextEditingController();
  TextEditingController get controllerIdCard => _controllerIdCard;

  @override
  void initListeners() {
    _initObserver();
  }

  Future<void> bookFlight(String title, String name, String idCard, Flight flight, User user, String departureDate, int amountPassenger, int price) async {
    //_user = user;
    _showLoading();
    _presenter.flightBooking(departureDate, flight.destinationFrom, flight.destinationTo, amountPassenger, amountPassenger*price, flight.id, user.token);
    do {
      await Future.delayed(const Duration(milliseconds: 100));
    } while (_isLoading);
    print("Nilai booking flight id : $_bookingFlightId");
    _presenter.passengerAdd(title, name, idCard, _bookingFlightId!, user.token);
    do {
      await Future.delayed(const Duration(milliseconds: 10));
    } while (_isLoading);
    final context = getContext();
    Navigator.pushReplacementNamed(context, HomePage.route, arguments: user);
  }

  void _initObserver() {
    _presenter.onErrorFlightBooking = (e) {
      _hideLoading();
    };
    _presenter.onErrorPassengerAdd = (e) {
      _hideLoading();
    };

    _presenter.onFinishFlightBooking = () {
      _hideLoading();
    };

    _presenter.onFinishPassengerAdd = () {
      _hideLoading();
    };
    _presenter.onSuccessPassengerAdd = (int? data) {
      //_passengers = data;
      _hideLoading();
    };
    _presenter.onSuccessFlightBooking = (int? data) {
      _bookingFlightId = data;
      _hideLoading();
    };
  }

  // void navigateToFlightSearch(Flight flight) {
  //   final context = getContext();
  //   Navigator.pushNamed(context, FlightSearchPage.route,
  //       arguments: _passengers);
  // }

  void _showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void _hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  void onChangedDropdownTitle(int value) {
    _valueDropdownTitle = value;
    refreshUI();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _controllerTitle.dispose();
    _controllerName.dispose();
    _controllerIdCard.dispose();
    _presenter.dispose();
  }
}

class PassengersArgument {
  List<Passenger> passengers;
  User user;
  PassengersArgument(this.passengers, this.user);
}
