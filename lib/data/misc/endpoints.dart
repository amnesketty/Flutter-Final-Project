import 'package:lounga/domain/entities/flight.dart';

class Endpoints {
  String get login => 'Auth/login';
  String get getAllFlights => 'Flight/GetAllFlight';
  String get findFlights => 'BookingFlight/FindFlight';
  String get addPassengers => 'BookingFlight/AddPassengers';
  String get bookingFlight => 'BookingFlight/AddBookingFlight';
  String get getHotel => 'Hotel/gethotel';
  String get findHotel => 'BookingHotel/FindHotel';
  String get bookingHotel => 'BookingHotel/AddBookingHotel';
  String get register => 'Auth/register';
}
