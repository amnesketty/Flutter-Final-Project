import 'package:dio/dio.dart';
import 'package:lounga/domain/entities/hotel.dart';
import 'package:lounga/domain/repositories/users_repository.dart';
import '../../domain/entities/user.dart';
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
  
}