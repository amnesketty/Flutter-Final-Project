import 'package:flutter/material.dart';
import 'package:lounga/app/pages/flight_detail/flight_detail_page.dart';
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
  }

  void _initObserver() {
    _presenter.onErrorFlightFind = (e) {};
    _presenter.onFinishFlightFind = () {
      _hideLoading();
    };
    _presenter.onSuccessFlightFind = (List<Flight> data) {
      _flights = data;
    };
  }

  void navigateToFlightDetail(Flight flight, User user, String departureDate,
      int amountPassenger, int price, String destinationFrom, String destinationTo, String seatClass) {
    final context = getContext();
    Navigator.pushNamed(context, FlightDetailPage.route,
        arguments: FlightFindArgument(
            flight, user, departureDate, amountPassenger, price, destinationFrom, destinationTo, seatClass));
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
    _presenter.dispose();
  }
}

class FlightFindArgument {
  Flight flight;
  User user;
  String departureDate;
  int amountPassenger;
  int price;
  String destinationFrom;
  String destinationTo;
  String seatClass;
  FlightFindArgument(this.flight, this.user, this.departureDate,
      this.amountPassenger, this.price, this.destinationFrom, this.destinationTo, this.seatClass);
}
