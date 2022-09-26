import 'package:lounga/domain/entities/flight.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'flight_get_presenter.dart';

class FlightGetController extends Controller {
  final FlightGetPresenter _presenter;

  FlightGetController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Flight> _flights = [];
  List<Flight> get flights => _flights;

  @override
  void initListeners() {
    _initObserver();
    _getFlight();
  }

  void _getFlight() {
    _showLoading();
    _presenter.getFlight();
  }

  void _initObserver() {
    _presenter.onErrorFlightGet = (e) {};
    _presenter.onFinishFlightGet = () {
      _hideLoading();
    };
    _presenter.onSuccessFlightGet = (List<Flight> data) {
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
