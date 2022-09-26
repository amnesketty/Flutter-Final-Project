import 'package:dio/dio.dart';
import 'package:lounga/domain/entities/flight.dart';
import '../../domain/repositories/flights_repository.dart';
import '../misc/endpoints.dart';

class DataFlightRepository implements FlightRepository {
  final Endpoints endpoints;
  final Dio dio;

  DataFlightRepository({required this.endpoints, required this.dio});

  @override
  Future<List<Flight>> getAllFlight() async {
    // TODO: implement getFlight
    try {
      final response = await dio.get(endpoints.getAllFlights);
      print(response);
      final getFlightsResponse = response.data['data'] as List<dynamic>;
      print(getFlightsResponse);
      final flights = getFlightsResponse
          .map(
            (dynamic response) => Flight.fromResponse(response),
          )
          .toList();

      print(flights);
      return flights;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Flight>> findFlight(String seatClass, String destinationFrom,
      String destinationTo, String departureDate) async {
    // TODO: implement findFlight
    dio.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIyIiwibmFtZSI6Im5pbmRpIiwibmJmIjoxNjY0MTYwMzIwLCJleHAiOjE2NjQxNjM5MjAsImlhdCI6MTY2NDE2MDMyMH0.LLkPgHgcfIkW9IFjhZ9JinTCbL7Xv2q3QctzjPXt_hs';
    try {
      final response = await dio.post(endpoints.findFlights, data: {
        "seatClass": seatClass,
        "destinationFrom": destinationFrom,
        "destinationTo": destinationTo,
        "departureDate": departureDate
      });
      //print(response.data['data']);
      final findFlightsResponse = response.data['data'] as List<dynamic>;
      final flights = findFlightsResponse
          .map(
            (dynamic response) => Flight.fromResponse(response),
          )
          .toList();

      //print(userResponse);
      print(flights);
      return flights;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}