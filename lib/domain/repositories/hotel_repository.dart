import '../entities/hotel.dart';

abstract class HotelRepository {
  Future<List<Hotel>> getHotel(String city);
  
  Future<List<Hotel>> findHotel(String city, String bookingDate, int totalRoom, int duration);

  Future<int> bookingHotel(String bookingDate, int totalRoom, int price, int hotelId, int roomId);
  
  Future<bool> addGuest(String name, String email, String phone, int bookingHotelId);
}