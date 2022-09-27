import 'package:flutter/material.dart';

import '../../domain/entities/flight.dart';

class FlightTile extends StatelessWidget {
  final Flight flight;
  final Function(Flight) onFlightClicked;

  const FlightTile({
    super.key,
    required this.flight,
    required this.onFlightClicked,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => onFlightClicked(flight),
        // leading: Image.network(user.image),
        title: Text(flight.aircraft),
        subtitle: Text(flight.aircraftsType),
      );
}
