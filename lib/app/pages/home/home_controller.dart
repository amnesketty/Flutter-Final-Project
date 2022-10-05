import 'package:flutter/material.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/app/pages/flight_search/flight_search_page.dart';
import 'package:lounga/app/pages/hotel_search/hotel_search_page.dart';
import 'package:lounga/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/entities/user_transaction.dart';

import '../hotel_detail/hotel_detail_page.dart';
import 'home_presenter.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(this._presenter);

  int _bottomNavigationValue = 0;
  int get bottomNavigationValue => _bottomNavigationValue;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserTransaction? _userTransaction = UserTransaction(username: '', bookingHotels: [], bookingFlights: []);
  UserTransaction? get userTransaction => _userTransaction;

  int _dropDownValueTransaction = 1;
  int get dropDownValueTransaction => _dropDownValueTransaction;
  
  @override
  void initListeners() {
    _initObserver();
    //_findHotel();
  }

  void _initObserver() {
    _presenter.onErrorUserTransaction = (e) {
      _hideLoading();
    };
    _presenter.onFinishUserTransaction = () {
      _hideLoading();
    };
    _presenter.onSuccessUserTransaction = (UserTransaction? data) {
      _userTransaction = data;
    };
  }

  Future<void> bottomNavigationMove(int index, String token) async {
    _bottomNavigationValue = index;
    refreshUI();
    if (index == 1) //&& _userTransaction?.username == '')
    {
      _showLoading();
      _presenter.getUserTransaction(token);
      do {
        await Future.delayed(const Duration(milliseconds: 100));
      } while (_isLoading);
    }
  }

  void navigateToSearchFlight(User user) {
    final context = getContext();
    Navigator.pushNamed(context, FlightSearchPage.route, arguments: user);
  }

  void navigateToSearchHotel(User user) {
    final context = getContext();
    Navigator.pushNamed(context, HotelSearchPage.route, arguments: user);
  }

  void getUserTransaction(String token) {
    _showLoading();
    _presenter.getUserTransaction(token);
  }

  void refreshUserTransaction(int value) {
    _dropDownValueTransaction = value;
    refreshUI();
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