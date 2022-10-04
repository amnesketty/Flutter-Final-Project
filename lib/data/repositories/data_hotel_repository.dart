import 'package:dio/dio.dart';
import 'package:lounga/domain/entities/hotel.dart';
import '../../domain/entities/hotel_bookings.dart';
import '../../domain/repositories/hotel_repository.dart';
import '../misc/endpoints.dart';

class DataHotelRepository implements HotelRepository {
  final Endpoints endpoints;
  final Dio dio;

  DataHotelRepository({required this.endpoints, required this.dio});

  @override
  Future<List<Hotel>> getHotel(String city) async {
    // TODO: implement getHotel
    try {
      // dio.options.headers['city'] = city;
      final response = await dio.get(
        endpoints.getHotel,
        queryParameters: {'city': city}
      );
      // print(response);
      final getHotelResponse = response.data['data'] as List<dynamic>;
      print(getHotelResponse[0]);
      final hotels = getHotelResponse
        .map(
          (dynamic response) => Hotel.fromResponse(response),
        ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  @override
  Future<List<Hotel>> findHotel(String city, String bookingDate, int totalRoom, int duration, String token) async {
    // TODO: implement findHotel
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(
        endpoints.findHotel,
        data: {
          'city': city, 
          'bookingDate': bookingDate,
          'totalRoom': totalRoom,
          'duration': duration,
          }
      );
      // print(response);
      final findHotelResponse = response.data['data'] as List<dynamic>;
      // print(findHotelResponse[0]);
      final hotels = findHotelResponse
        .map(
          (dynamic response) => Hotel.fromResponse(response),
        ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  @override
  Future<int> bookingHotel(String bookingDate, int totalRoom, int price, int hotelId, int roomId, String token) async {
    // TODO: implement bookingHotel
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(
        endpoints.bookingHotel,
        data: {
          'bookingDate': bookingDate,
          'totalRoom': totalRoom,
          'price': price,
          }
      );
      // print(response);
      final bookingHotelResponse = response.data['data']['id'] as int;
      print(bookingHotelResponse);
      return bookingHotelResponse;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> addGuest(String name, String email, String phone, int bookingHotelId) async {
    dio.options.headers['Authorization'] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmFtZSI6InNhbHNhIiwibmJmIjoxNjY0NDQwOTUzLCJleHAiOjE2NjUwNDU3NTMsImlhdCI6MTY2NDQ0MDk1M30.Jf0ChgYGrGA8xLgRhjRgWhAYswlKTcLD0NsJd6YynHE";
    try {
      final response = await dio.post(
        endpoints.addGuest,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'bookingHotelId': bookingHotelId,
          }
      );
      // print(response);
      final addGuestResponse = response.data['success'] as bool;
      print(addGuestResponse);
      return addGuestResponse;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}