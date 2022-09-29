import 'package:lounga/domain/entities/flight.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'flight_detail_presenter.dart';

class FlightDetailController extends Controller {
  final FlightDetailPresenter _presenter;

  FlightDetailController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Flight> _flights = [];
  List<Flight> get flights => _flights;

  @override
  void initListeners() {
    _initObserver();
    _detailFlight();
  }

  void _detailFlight() {
    _showLoading();
    _presenter.detailFlight();
  }

  void _initObserver() {
    _presenter.onErrorFlightDetail = (e) {};
    _presenter.onFinishFlightDetail = () {
      _hideLoading();
    };
    _presenter.onSuccessFlightDetail = (List<Flight> data) {
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
