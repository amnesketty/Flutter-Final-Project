import 'package:lounga/domain/entities/flight.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
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
    _findFlight();
  }

  void _findFlight() {
    _showLoading();
    _presenter.findFlight();
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
