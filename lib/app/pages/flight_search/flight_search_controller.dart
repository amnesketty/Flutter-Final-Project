import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/domain/entities/flight.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/entities/user.dart';
import 'flight_search_presenter.dart';

class FlightSearchController extends Controller {
  final FlightSearchPresenter _presenter;

  FlightSearchController(this._presenter);

  final int _valueDropdownTitle = 1;
  int get valueDropdownTitle => _valueDropdownTitle;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late User _user;

  int _bottomNavigationValue = 0;
  int get bottomNavigationValue => _bottomNavigationValue;

  List<Flight> _flights = [];
  List<Flight> get flights => _flights;

  final List<String> _dropDownValueDestination = [
    'Yogyakarta (YIA)',
    'Medan (KNO)',
    'Jakarta (CGK)',
    'Semarang (SRG)',
    'Makassar (UPG)'
  ];
  List<String> get dropdownvalueDestination => _dropDownValueDestination;
  int _destinationFrom = 0;
  int get destinationFrom => _destinationFrom;
  int _destinationTo = 1;
  int get destinationTo => _destinationTo;

  final List<String> _dropDownValueSeatClass = [
    'Economy',
    'Business',
    'First Class',
  ];
  List<String> get dropdownvalueSeatClass => _dropDownValueSeatClass;
  int _seatClass = 0;
  int get seatClass => _seatClass;

  final TextEditingController _controllerdepartureDate =
      TextEditingController();
  TextEditingController get controllerdepartureDate => _controllerdepartureDate;
  final TextEditingController _controlleramountPassenger =
      TextEditingController();
  TextEditingController get controlleramountPassenger =>
      _controlleramountPassenger;

  @override
  void initListeners() {
    _initObserver();
    _controllerdepartureDate.text = DateTime.now().toString().substring(0, 10);
  }

  Future<void> searchFlight(
      String seatClass,
      String destinationFrom,
      String destinationTo,
      String departureDate,
      int amountPassenger,
      User user) async {
    _user = user;
    _showLoading();
    _presenter.searchFlight(seatClass, destinationFrom, destinationTo,
        departureDate + 'T00:00:00.000Z', amountPassenger, user.token);
    do {
      await Future.delayed(const Duration(milliseconds: 10));
    } while (_isLoading);
    final context = getContext();
    Navigator.pushNamed(context, FlightFindPage.route,
        arguments: FlightsArgument(
            _flights,
            _user,
            departureDate + 'T00:00:00.000Z',
            amountPassenger,
            destinationFrom,
            destinationTo,
            seatClass));
  }

  void changeDate(String date) {
    _controllerdepartureDate.text = date;
    refreshUI();
  }

  void _initObserver() {
    _presenter.onErrorFlightSearch = (e) {};
    _presenter.onFinishFlightSearch = () {
      _hideLoading();
    };
    _presenter.onSuccessFlightSearch = (List<Flight> data) {
      _flights = data;
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

  void onChangedDropdownDestinationFrom(int value) {
    _destinationFrom = value;
    refreshUI();
  }

  void onChangedDropdownDestinationTo(int value) {
    _destinationTo = value;
    refreshUI();
  }

  void onChangedDropdownSeatClass(int value) {
    _seatClass = value;
    refreshUI();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _controllerdepartureDate.dispose();
    _controlleramountPassenger.dispose();
    _presenter.dispose();
  }
}

class FlightsArgument {
  List<Flight> flights;
  User user;
  String departureDate;
  int amountPassenger;
  String destinationFrom;
  String destinationTo;
  String seatClass;
  FlightsArgument(
      this.flights,
      this.user,
      this.departureDate,
      this.amountPassenger,
      this.destinationFrom,
      this.destinationTo,
      this.seatClass);
}
