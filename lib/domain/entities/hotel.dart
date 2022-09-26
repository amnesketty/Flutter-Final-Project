import 'package:flutter/cupertino.dart';

class Hotel {
  final String name, phone, address, city;
  final int id, rating;

  Hotel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.rating
  });

  factory Hotel.fromResponse(Map<String, dynamic> response) {
    final name = response['name'] ?? '';
    final phone = response['phone'] ?? '';
    final address = response['address'] ?? '';
    final city = response['city'] ?? '';
    final id = response['id'] ?? 0;
    final rating = response['rating'] ?? 0;

    return Hotel(name: name, phone: phone, address: address, city: city, rating: rating, id: id);
  }
}