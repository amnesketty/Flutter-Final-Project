import 'package:flutter/material.dart';
import 'package:lounga/app/pages/flight_find/flight_find_page.dart';
import 'package:lounga/app/pages/flight_search/flight_search_page.dart';
import 'package:lounga/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../hotel_detail/hotel_detail_page.dart';

class HomeController extends Controller {
  // final HotelFindPresenter _presenter;

  // HotelFindController(this._presenter);

  int _bottomNavigationValue = 0;
  int get bottomNavigationValue => _bottomNavigationValue;
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  // List<Hotel> _hotels = [];
  // List<Hotel> get hotels => _hotels;
  
  @override
  void initListeners() {
    //_initObserver();
    //_findHotel();
  }

  void bottomNavigationMove(int index) {
    _bottomNavigationValue = index;
    refreshUI();
  }

  void navigateToSearchFlight(User user) {
    final context = getContext();
    Navigator.pushNamed(context, FlightSearchPage.route, arguments: user);
  }
}