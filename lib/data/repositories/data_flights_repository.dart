import 'package:dio/dio.dart';
import 'package:lounga/domain/entities/flight.dart';
import 'package:lounga/domain/entities/passenger.dart';
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
  Future<List<Flight>> findFlight(
      String seatClass,
      String destinationFrom,
      String destinationTo,
      String departureDate,
      int amountPassengers,
      String token) async {
    // TODO: implement findFlight
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.findFlights, data: {
        "seatClass": seatClass,
        "destinationFrom": destinationFrom,
        "destinationTo": destinationTo,
        "departureDate": departureDate,
        "amountPassengers": amountPassengers
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

  Future<int> addPassenger(
      String title, String name, String idCard, int bookingFlightId, String token) async {
    // TODO: implement findFlight
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.addPassenger,
          data: {
            "title": title,
            "name": name,
            "idCard": idCard,
            "bookingFlightId": bookingFlightId});
      //print(response.data['data']);
      final addPassengersResponse = response.data['data'] as Map<String, dynamic>;
      int passengerId = addPassengersResponse['id'];
      return passengerId;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<int> bookingFlight(
      String bookingDate,
      String airline,
      String destinationFrom,
      String destinationTo,
      String departureTime,
      String arrivalTime,
      String seatClass,
      int flightId,
      String token) async {
    // TODO: implement findFlight
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.bookingFlight, data: {
        "bookingDate": bookingDate,
        "airline": airline,
        "destinationFrom": destinationFrom,
        "destinationTo": destinationTo,
        "departureTime": departureTime,
        "arrivalTime": arrivalTime,
        "seatClass": seatClass
      });
      final bookingFlightsResponse =
          response.data['data'] as Map<String, dynamic>;
      int bookingFlightsId = bookingFlightsResponse['id'];
      return bookingFlightsId;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
