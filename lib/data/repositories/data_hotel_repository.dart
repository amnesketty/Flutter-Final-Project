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
  Future<List<Hotel>> findHotel(String city, String bookingDate, int totalRoom, int duration) async {
    // TODO: implement findHotel
    dio.options.headers['Authorization'] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIzIiwibmFtZSI6ImhhZmlkeiIsIm5iZiI6MTY2NDE2NTE1NywiZXhwIjoxNjY0MTY4NzU3LCJpYXQiOjE2NjQxNjUxNTd9.zdi_0Z4COV4yEtV4LZqzsaJwXPb3aq3o3QM8Rc9V0GU";
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