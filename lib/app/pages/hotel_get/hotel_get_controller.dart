import 'package:lounga/app/pages/hotel_get/hotel_get_presenter.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HotelGetController extends Controller {
  final HotelGetPresenter _presenter;

  HotelGetController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;
  
  @override
  void initListeners() {
    _initObserver();
    _getHotel();
  }

  void _getHotel() {
    _showLoading();
    _presenter.getHotel();
  }

  void _initObserver(){
    _presenter.onErrorHotelGet = (e) {};
    _presenter.onFinishHotelGet = () {
      _hideLoading();
    };
    _presenter.onSuccessHotelGet = (List<Hotel> data) {
      _hotels= data;
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
    _presenter.dispose();
  }
}