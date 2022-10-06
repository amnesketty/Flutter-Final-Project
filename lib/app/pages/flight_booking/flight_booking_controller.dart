import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_presenter.dart';
import 'package:lounga/domain/entities/passenger.dart';
import 'package:lounga/domain/entities/user.dart';
import '../../../domain/entities/flight.dart';
import '../home/home_page.dart';

class FlightBookingController extends Controller {
  final FlightBookingPresenter _presenter;

  FlightBookingController(this._presenter);

  List<int> _valueDropdownTitle = [1, 1, 1, 1];
  List<int> get valueDropdownTitle => _valueDropdownTitle;

  late User _user;

  int? _bookingFlightId;
  int? get bookingFlightId => _bookingFlightId;

  bool? _addPassengersResponse = false;
  bool? get addPassengersResponse => _addPassengersResponse;

  List<SinglePassenger> _listPassenger = [];
  List<SinglePassenger> get listPassenger => _listPassenger;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<TextEditingController> _controllerTitle = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> get controllerTitle => _controllerTitle;
  final List<TextEditingController> _controllerName = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> get controllerName => _controllerName;
  final List<TextEditingController> _controllerIdCard = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> get controllerIdCard => _controllerIdCard;

  @override
  void initListeners() {
    _initObserver();
    _controllerTitle[0].text = 'Mr.';
    _controllerTitle[1].text = 'Mr.';
    _controllerTitle[2].text = 'Mr.';
    _controllerTitle[3].text = 'Mr.';
  }

  Future<void> bookFlight(Flight flight, User user, String departureDate,
      int amountPassenger, int price) async {
    _showLoading();
    _presenter.flightBooking(
        departureDate,
        flight.destinationFrom,
        flight.destinationTo,
        amountPassenger,
        amountPassenger * price,
        flight.id,
        user.token);
    do {
      await Future.delayed(const Duration(milliseconds: 100));
    } while (_isLoading);
    for (int i = 0; i < amountPassenger; i++) {
      SinglePassenger singlePassenger = SinglePassenger(
          title: _controllerTitle[i].text,
          name: _controllerName[i].text,
          idCard: _controllerIdCard[i].text,
          bookingFlightId: _bookingFlightId!);
      _listPassenger.add(singlePassenger);
    }
    _presenter.passengerAddList(_listPassenger, user.token);
    do {
      await Future.delayed(const Duration(milliseconds: 10));
    } while (_isLoading);
  }

  void navigateToHomePage(User user) {
    final context = getContext();
    Navigator.pushNamed(context, HomePage.route, arguments: user);
  }

  void _initObserver() {
    _presenter.onErrorFlightBooking = (e) {
      _hideLoading();
    };
    _presenter.onErrorPassengerAdd = (e) {
      _hideLoading();
    };
    _presenter.onErrorPassengerAddList = (e) {
      _hideLoading();
    };

    _presenter.onFinishFlightBooking = () {
      _hideLoading();
    };
    _presenter.onFinishPassengerAdd = () {
      _hideLoading();
    };
    _presenter.onFinishPassengerAddList = () {
      _hideLoading();
    };

    _presenter.onSuccessFlightBooking = (int? data) {
      _bookingFlightId = data;
      _hideLoading();
    };
    _presenter.onSuccessPassengerAdd = (int? data) {
      //_passengers = data;
      _hideLoading();
    };
    _presenter.onSuccessPassengerAddList = (bool? data) {
      _addPassengersResponse = data;
      _hideLoading();
    };
  }

  void _showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void _hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  void onChangedDropdownTitle(int index, int value) {
    _valueDropdownTitle[index] = value;
    if (value == 1) {
      _controllerTitle[index].text = 'Mr.';
    } else if (value == 2) {
      _controllerTitle[index].text = 'Ms.';
    } else {
      _controllerTitle[index].text = 'Mrs.';
    }
    refreshUI();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _presenter.dispose();
  }
}

class PassengersArgument {
  List<Passenger> passengers;
  User user;
  PassengersArgument(this.passengers, this.user);
}
