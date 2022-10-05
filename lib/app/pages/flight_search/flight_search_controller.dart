import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/domain/entities/flight.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/entities/user.dart';
import 'flight_search_presenter.dart';

class FlightSearchController extends Controller {
  final FlightSearchPresenter _presenter;

  FlightSearchController(this._presenter);

  int _valueDropdownTitle = 1;
  int get valueDropdownTitle => _valueDropdownTitle;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late User _user;

  List<Flight> _flights = [];
  List<Flight> get flights => _flights;

  List<String> _dropDownValue = [
    'Yogyakarta (YIA)',
    'Medan (KNO)',
    'Jakarta (CGK)',
    'Seamrang (SRG)',
    'Makassar (UPG)'
  ];
  List<String> get dropdownvalue => _dropDownValue;
  int _destinationFrom = 0;
  int get destinationFrom => _destinationFrom;
  int _destinationTo = 0;
  int get destinationTo => _destinationTo;

  TextEditingController dateCtl = TextEditingController();
  TextEditingController _controllerseatClass = TextEditingController();
  TextEditingController get controllerseatClass => _controllerseatClass;
  // TextEditingController _controllerdestinationFrom = TextEditingController();
  // TextEditingController get controllerdestinationFrom =>
  //     _controllerdestinationFrom;
  // TextEditingController _controllerdestinationTo = TextEditingController();
  // TextEditingController get controllerdestinationTo => _controllerdestinationTo;
  TextEditingController _controllerdepartureDate = TextEditingController();
  TextEditingController get controllerdepartureDate => _controllerdepartureDate;
  TextEditingController _controlleramountPassenger = TextEditingController();
  TextEditingController get controlleramountPassenger =>
      _controlleramountPassenger;

  @override
  void initListeners() {
    _initObserver();
    // _searchFlight();
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
        departureDate, amountPassenger, user.token);
    do {
      await Future.delayed(const Duration(milliseconds: 10));
    } while (_isLoading);
    final context = getContext();
    Navigator.pushNamed(context, FlightFindPage.route,
        arguments:
            FlightsArgument(_flights, _user, departureDate, amountPassenger));
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
    _destinationFrom = value;
    refreshUI();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _controllerseatClass.dispose();
    // _controllerdestinationFrom.dispose();
    // _controllerdestinationTo.dispose();
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
  FlightsArgument(
      this.flights, this.user, this.departureDate, this.amountPassenger);
}
