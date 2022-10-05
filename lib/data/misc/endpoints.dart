import 'package:lounga/domain/entities/flight.dart';

class Endpoints {
  String get login => 'Auth/login';
  String get getAllFlights => 'Flight/GetAllFlight';
  String get findFlights => 'BookingFlight/FindFlight';
  String get addPassenger => 'BookingFlight/AddPassenger';
  String get bookingFlight => 'BookingFlight/AddBookingFlight';
  String get getHotel => 'Hotel/gethotel';
  String get findHotel => 'BookingHotel/FindHotel';
  String get bookingHotel => 'BookingHotel/AddBookingHotel';
  String get addGuest => 'BookingHotel/AddGuest';
  String get register => 'Auth/register';
  String get userTransaction => 'Auth/transaction-history';
}
