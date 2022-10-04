import 'package:lounga/domain/entities/flight.dart';

class Endpoints {
  String get login => 'Auth/login';
  String get getAllFlights => 'Flight/GetAllFlight';
  String get findFlights => 'BookingFlight/FindFlight';
   String get bookingFlight => 'BookingFlight/AddBookingFlight';
  String get addPassengers => 'BookingFlight/AddPassengers';
  String get getHotel => 'Hotel/gethotel';
  String get findHotel => 'BookingHotel/FindHotel';
  String get bookingHotel => 'BookingHotel/AddBookingHotel';
  String get addGuest => 'BookingHotel/Guest';
  String get register => 'Auth/register';
  String get userTransaction => 'Auth/transaction-history';
}
