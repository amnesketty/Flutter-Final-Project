class Endpoints {
  String get register => 'Auth/register';
  String get login => 'Auth/login';
  String get userTransaction => 'Auth/transaction-history';

  String get getAllFlights => 'Flight/GetAllFlight';
  String get findFlights => 'BookingFlight/FindFlight';
  String get bookingFlight => 'BookingFlight/AddBookingFlight';
  String get addPassenger => 'BookingFlight/AddPassenger';
  String get addListPassenger => 'BookingFlight/AddListPassenger';

  String get getHotel => 'Hotel/gethotel';
  String get findHotel => 'BookingHotel/FindHotel';
  String get bookingHotel => 'BookingHotel/AddBookingHotel';
  String get addGuest => 'BookingHotel/AddGuest';
}
