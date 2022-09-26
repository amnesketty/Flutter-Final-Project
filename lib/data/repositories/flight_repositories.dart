import 'package:dio/dio.dart';
import 'package:lounga/domain/entities/flight.dart';
import '../misc/endpoints.dart';

abstract class FlightRepository {
  Future<List<Flight>> flights();
}

class FlightRepositoryImpl implements FlightRepository {
  final Endpoints endpoints;
  final Dio dio;

  FlightRepositoryImpl({required this.endpoints, required this.dio});

  @override
  Future<List<Flight>> flights() async {
    try {
      final response = await dio.get(endpoints.flights);
      final flightsResponse = response.data['data'] as List<dynamic>;
      final flights = flightsResponse
          .map(
            (dynamic response) => Flight.fromResponse(response),
          )
          .toList();
      return flights;
    } catch (e) {
      rethrow;
    }
  }
}
