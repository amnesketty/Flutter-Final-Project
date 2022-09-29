import 'package:flutter/cupertino.dart';
import 'package:lounga/domain/entities/flight.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'flight_search_presenter.dart';

class FlightSearchController extends Controller {
  final FlightSearchPresenter _presenter;

  FlightSearchController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Flight> _flights = [];
  List<Flight> get flights => _flights;
  TextEditingController dateCtl = TextEditingController();

  @override
  void initListeners() {
    _initObserver();
    _searchFlight();
  }

  void _searchFlight() {
    _showLoading();
    _presenter.searchFlight();
  }

  void _initObserver() {
    _presenter.onErrorFlightSearch = (e) {};
    _presenter.onFinishFlightSearch = () {
      _hideLoading();
    };
    _presenter.onSuccessFlightSearch = (List<Flight> data) {
      _flights = data;
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
