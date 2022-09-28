
import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter/material.dart';

class HotelTile extends StatelessWidget {
  final Hotel hotel;
  final Function(Hotel) onHotelClicked;

  const HotelTile({
    super.key,
    required this.hotel,
    required this.onHotelClicked,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => onHotelClicked(hotel),
        // leading: Image.network(user.image),
        // title: Text(user.fullName),
        // subtitle: Text(user.email),
      );
}