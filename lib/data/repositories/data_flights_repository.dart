import 'dart:convert';

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
    try {
      final response = await dio.get(endpoints.getAllFlights);
      final getFlightsResponse = response.data['data'] as List<dynamic>;
      final flights = getFlightsResponse
          .map(
            (dynamic response) => Flight.fromResponse(response),
          )
          .toList();
      return flights;
    } catch (e) {
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
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.findFlights, data: {
        "seatClass": seatClass,
        "destinationFrom": destinationFrom,
        "destinationTo": destinationTo,
        "departureDate": departureDate,
        "amountPassengers": amountPassengers
      });
      final findFlightsResponse = response.data['data'] as List<dynamic>;
      final flights = findFlightsResponse
          .map(
            (dynamic response) => Flight.fromResponse(response),
          )
          .toList();
      return flights;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> bookingFlight(
      String bookingDate,
      String destinationFrom,
      String destinationTo,
      int amountPassenger,
      int totalPrice,
      int flightId,
      String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.bookingFlight, data: {
        "bookingDate": bookingDate,
        "destinationFrom": destinationFrom,
        "destinationTo": destinationTo,
        "amountPassenger": amountPassenger,
        "totalPrice": totalPrice,
        "flightId": flightId,
      });
      final bookingFlightsResponse =
          response.data['data'] as Map<String, dynamic>;
      int bookingFlightsId = bookingFlightsResponse['id'];
      return bookingFlightsId;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> addPassenger(
    String title, String name, String idCard, int bookingFlightId, String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.addPassenger,
          data: {
            "title": title,
            "name": name,
            "idCard": idCard,
            "bookingFlightId": bookingFlightId});
      final addPassengersResponse = response.data['data'] as Map<String, dynamic>;
      int passengerId = addPassengersResponse['id'];
      return passengerId;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addListPassenger(List<SinglePassenger> listPassenger, String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(endpoints.addListPassenger,
          data: {
            "data" : listPassenger
          });
      bool passengerSuccess = response.data['success'];
      return passengerSuccess;
    } catch (e) {
      rethrow;
    }
  }
}
