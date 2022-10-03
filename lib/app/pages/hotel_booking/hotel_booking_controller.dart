import 'package:flutter/cupertino.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/usecases/cases/hotel_booking.dart';

import 'hotel_booking_presenter.dart';

class HotelBookingController extends Controller {
  final HotelBookingPresenter _presenter;

  HotelBookingController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int? _bookingHotelId = 0;
  int? get bookingHotelId => _bookingHotelId;

  final TextEditingController _controllerContactName = TextEditingController();
  TextEditingController get controllerContactName => _controllerContactName;
  final TextEditingController _controllerEmail = TextEditingController();
  TextEditingController get controllerEmail => _controllerEmail;
  final TextEditingController _controllerPhone = TextEditingController();
  TextEditingController get controllerPhone => _controllerPhone;
  
  @override
  void initListeners() {
    // _initObserver();
  }

  void _initObserver() {
    _presenter.onErrorHotelBooking = (e) {
      _hideLoading();
    };
    _presenter.onFinishHotelBooking = () {
      _hideLoading();
    };
    _presenter.onSuccessHotelBooking = (int? data) {
      _bookingHotelId = data;
      _hideLoading();
    };

    _presenter.onErrorHotelGuest = (e) {
      _hideLoading();
    };
    _presenter.onFinishHotelGuest = () {
      _hideLoading();
    };
    _presenter.onSuccessHotelGuest = (bool? data) {
      _hideLoading();
    };
  }

  void bookingNow(String bookingDate, int totalRoom, int price, int hotelId, int roomId) {
     _showLoading();
    _presenter.hotelBooking(bookingDate, totalRoom, price, hotelId, roomId);
  }

  void addGuest(String name, String email, String phone) {
    _presenter.hotelGuest(name, email, phone, _bookingHotelId!);
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
    _controllerContactName.dispose();
    _controllerEmail.dispose();
    _controllerPhone.dispose();
    _presenter.dispose();
  }
 
}