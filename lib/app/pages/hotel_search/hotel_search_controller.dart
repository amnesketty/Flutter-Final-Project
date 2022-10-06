import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/entities/user.dart';
import '../hotel_find/hotel_find_page.dart';
import 'hotel_search_presenter.dart';

class HotelSearchController extends Controller {
  final HotelSearchPresenter _presenter;

  HotelSearchController(this._presenter);

  int _bottomNavigationValue = 0;
  int get bottomNavigationValue => _bottomNavigationValue;

  int _valueDropdownTitle = 0;
  int get valueDropdownTitle => _valueDropdownTitle;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late User _user;

  List<Hotel> _hotel = [];
  List<Hotel> get hotels => _hotel;

  final List<String> _dropDownValue = [
    'Jakarta',
    'Makassar',
    'Medan',
    'Semarang',
    'Yogyakarta',
  ];
  List<String> get dropdownvalue => _dropDownValue;
  int _city = 0;
  int get city => _city;


  TextEditingController dateCtl = TextEditingController();
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
    _controllerBookingDate.text = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now());
    // _searchHotel();
  }

  Future<void> searchHotels (String city, String bookingDate, int totalRoom, int duration, User user) async {
    _user = user;
    print(_controllerBookingDate.text);
    _showLoading();
    _presenter.searchHotel(city, bookingDate, totalRoom, duration, user.token);
    do {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    while(_isLoading == true);
    final context = getContext();
    Navigator.pushNamed(context, HotelFindPage.route, arguments: 
      HotelsArgument(_hotel, _user, bookingDate, totalRoom ));
  }

  // Future<void> bottomNavigationMove(int index, String token) async {
  //   _bottomNavigationValue = index;
  //   refreshUI();
  //   if (index == 1) //&& _userTransaction?.username == '')
  //   {
  //     _showLoading();
  //     _presenter.getUserTransaction(token);
  //     do {
  //       await Future.delayed(const Duration(milliseconds: 100));
  //     } while (_isLoading);
  //   }
  // }

  void changeDate(String date) {
    _controllerBookingDate.text = date;
    refreshUI();
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

  void onChangedDropdownCity(int value) {
    _city = value;
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

class HotelsArgument {
  List<Hotel> hotels;
  User user;
  String bookingDate;
  int totalRoom;
  HotelsArgument(this.hotels, this.user, this.bookingDate, this.totalRoom);
}
