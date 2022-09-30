import 'package:flutter/cupertino.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../hotel_find/hotel_find_page.dart';
import 'hotel_search_presenter.dart';

class HotelSearchController extends Controller {
  final HotelSearchPresenter _presenter;

  HotelSearchController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Hotel> _hotel = [];
  List<Hotel> get hotels => _hotel;
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController get controllerCity => _controllerCity;
  TextEditingController _controllerBookingDate = TextEditingController();
  TextEditingController get controllerBookingDate => _controllerBookingDate;
  TextEditingController _controllerRoom = TextEditingController();
  TextEditingController get controllerRoom => _controllerRoom;
  TextEditingController _controllerDuration = TextEditingController();
  TextEditingController get controllerDuration => _controllerDuration;


  @override
  void initListeners() {
    _initObserver();
    // _searchFlight();
  }

  void navigateToHotelFind(Hotel hotel) {
    final context = getContext();
    Navigator.pushNamed(context, HotelFindPage.route, arguments: hotel);
  }

  Future<void> searchHotels (String city, String bookingDate, int totalRoom, int duration) async {
    _showLoading();
    _presenter.searchHotel(city, bookingDate, totalRoom, duration);
    do {
      await Future.delayed(const Duration(milliseconds: 1));
    }
    while(_isLoading == true);
    final context = getContext();
    Navigator.pushNamed(context, HotelFindPage.route, arguments: _hotel);
  }

  void _initObserver() {
    _presenter.onErrorHotelSearch = (e) {};
    _presenter.onFinishHotelSearch = () {
      _hideLoading();
    };
    _presenter.onSuccessHotelSearch = (List<Hotel> data) {
      _hotel = data;
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

   @override
  void onDisposed() {
    super.onDisposed();
    _controllerCity.dispose();
    _controllerBookingDate.dispose();
    _controllerRoom.dispose();
    _controllerDuration.dispose();
    _presenter.dispose();
  }
}
