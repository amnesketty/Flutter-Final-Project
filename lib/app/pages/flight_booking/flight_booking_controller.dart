import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FlightBookingController extends Controller {
  final FlightBookingController _presenter;

  FlightBookingController(this._presenter);

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
    // _initObserver();
  }

  // void _initObserver() {
  //   _presenter.onErrorHotelBooking = (e) {
  //     _hideLoading();
  //   };
  //   _presenter.onFinishHotelBooking = () {
  //     _hideLoading();
  //   };
  //   _presenter.onSuccessHotelBooking = (int? data) {
  //     _userId = data;
  //   };
  // }

  void bookingNow(
      String bookingDate,
      String airline,
      String destinationFrom,
      String destinationTo,
      String departureTime,
      String arrivalTime,
      String seatClass,
      int flightId) {
    _showLoading();
    _presenter.bookingNow(bookingDate, airline, destinationFrom, destinationTo,
        departureTime, arrivalTime, seatClass, flightId);
  }

  void addPassenger(
      String title, String name, String idCard, int bookingFlightId) {
    _presenter.addPassenger(title, name, idCard, bookingFlightId);
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
    _controllerTitle.dispose();
    _controllerName.dispose();
    _controllerIdCard.dispose();
    _presenter.dispose();
  }
}
