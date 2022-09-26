import 'package:dio/dio.dart';
import 'package:lounga/domain/entities/hotel.dart';
import '../../domain/entities/hotel.dart';
import '../../domain/repositories/hotel_repository.dart';
import '../misc/endpoints.dart';

class DataFindHotelRepository implements FindHotelRepository {
  final Endpoints endpoints;
  final Dio dio;

  DataFindHotelRepository({required this.endpoints, required this.dio});

  @override
  Future<List<Hotel>> findHotel(String city, String bookingDate, int totalRoom, int duration) async {
    // TODO: implement findHotel
    dio.options.headers['Authorization'] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmFtZSI6InNhbHNhIiwibmJmIjoxNjY0MTU4NjUyLCJleHAiOjE2NjQxNjIyNTIsImlhdCI6MTY2NDE1ODY1Mn0._Sp7lSaPBL2Hb8EC4h5pGoqcttrlr4OQrExBU_Sk-PU";
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
      print(response);
      final findHotelResponse = response.data['data'] as List<dynamic>;
      print(findHotelResponse[0]);
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
  
}