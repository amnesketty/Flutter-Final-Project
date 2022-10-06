import 'package:dio/dio.dart';
import 'package:lounga/domain/entities/hotel.dart';
import '../../domain/repositories/hotel_repository.dart';
import '../misc/endpoints.dart';

class DataHotelRepository implements HotelRepository {
  final Endpoints endpoints;
  final Dio dio;

  DataHotelRepository({required this.endpoints, required this.dio});

  @override
  Future<List<Hotel>> getHotel(String city) async {
    try {
      final response =
          await dio.get(endpoints.getHotel, queryParameters: {'city': city});
      final getHotelResponse = response.data['data'] as List<dynamic>;
      final hotels = getHotelResponse
          .map(
            (dynamic response) => Hotel.fromResponse(response),
          )
          .toList();
      return hotels;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Hotel>> findHotel(String city, String bookingDate, int totalRoom,
      int duration, String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.findHotel, data: {
        'city': city,
        'bookingDate': bookingDate,
        'totalRoom': totalRoom,
        'duration': duration,
      });
      final findHotelResponse = response.data['data'] as List<dynamic>;
      final hotels = findHotelResponse
          .map(
            (dynamic response) => Hotel.fromResponse(response),
          )
          .toList();
      return hotels;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> bookingHotel(String bookingDate, String name, int totalRoom,
      int price, int hotelId, int roomId, String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.bookingHotel, data: {
        'bookingDate': bookingDate,
        'name': name,
        'totalRoom': totalRoom,
        'price': price,
        'hotelId': hotelId,
        'roomId': roomId
      });
      final bookingHotelResponse = response.data['data']['id'] as int;
      return bookingHotelResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addGuest(String name, String email, String phone,
      int bookingHotelId, String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.addGuest, data: {
        'name': name,
        'email': email,
        'phone': phone,
        'bookingHotelId': bookingHotelId,
      });
      final addGuestResponse = response.data['success'] as bool;
      return addGuestResponse;
    } catch (e) {
      rethrow;
    }
  }
}
