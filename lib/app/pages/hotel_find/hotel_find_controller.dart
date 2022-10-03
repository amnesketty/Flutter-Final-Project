import 'package:flutter/material.dart';
import 'package:lounga/app/pages/hotel_find/hotel_find_presenter.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../hotel_detail/hotel_detail_page.dart';

class HotelFindController extends Controller {
  final HotelFindPresenter _presenter;

  HotelFindController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;
  
  @override
  void initListeners() {
    _initObserver();
    //_findHotel();
  }

  void _findHotel() {
    _showLoading();
    _presenter.findHotel();
  }

  void _initObserver(){
    _presenter.onErrorHotelFind = (e) {};
    _presenter.onFinishHotelFind = () {
      _hideLoading();
    };
    _presenter.onSuccessHotelFind = (List<Hotel> data) {
      _hotels= data;
    };
  }

  void navigateToHotelDetail(Hotel hotel) {
    final context = getContext();
    Navigator.pushNamed(context, HotelDetailPage.route, arguments: hotel);
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