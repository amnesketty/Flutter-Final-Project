import '../entities/hotel.dart';

abstract class HotelRepository {
  Future<List<Hotel>> getHotel(String city);
}

abstract class FindHotelRepository {
  Future<List<Hotel>> findHotel(String city, String bookingDate, int totalRoom, int duration);
}