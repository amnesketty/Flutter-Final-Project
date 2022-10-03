import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/flight_booking/flight_booking_page.dart';
import 'package:lounga/domain/entities/flight.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/entities/user.dart';
import 'flight_find_presenter.dart';

class FlightFindController extends Controller {
  final FlightFindPresenter _presenter;

  FlightFindController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Flight> _flights = [];
  List<Flight> get flights => _flights;

  @override
  void initListeners() {
    _initObserver();
    //_findFlight();
  }

  // void findFlight(String seatClass, String destinationFrom,
  //     String destinationTo, String departureDate, int amountPassenger) {
  //   _showLoading();
  //   _presenter.findFlight(seatClass, destinationFrom, destinationTo,
  //       departureDate, amountPassenger);
  // }

  void _initObserver() {
    _presenter.onErrorFlightFind = (e) {};
    _presenter.onFinishFlightFind = () {
      _hideLoading();
    };
    _presenter.onSuccessFlightFind = (List<Flight> data) {
      _flights = data;
    };
  }

  void navigateToFlightBooking(Flight flight, User user, String departureDate) {
    final context = getContext();
    Navigator.pushNamed(context, FlightBookingPage.route, arguments: FlightFindArgument(flight, user, departureDate));
  }

  void _showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void _hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    // _controllerseatClass.dispose();
    // _controllerdestinationFrom.dispose();
    // _controllerdestinationTo.dispose();
    // _controllerdepartureDate.dispose();
    _presenter.dispose();
  }
}

class FlightFindArgument {
  Flight flight;
  User user;
  String departureDate;
  FlightFindArgument(this.flight, this.user, this.departureDate);
}