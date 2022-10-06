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
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 10),
          Container(
              height: MediaQuery.of(context).size.height * 0.225,
              margin: const EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0XFFFFFFFF),
              ),
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 12.0, top: 10.0, right: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Transform.rotate(
                            angle: 1.57,
                            child: const Icon(Icons.airplanemode_on)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(flight.airline,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                      ]),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                          children: [
                            Text(
                                TimeOfDay(
                                        hour: int.parse(flight.departureTime
                                            .substring(11, 13)),
                                        minute: int.parse(flight.departureTime
                                            .substring(14, 16)))
                                    .format(context),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("-"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                                TimeOfDay(
                                        hour: int.parse(flight.arrivalTime
                                            .substring(11, 13)),
                                        minute: int.parse(flight.arrivalTime
                                            .substring(14, 16)))
                                    .format(context),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(flight.destinationFrom.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.arrow_right_alt_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(flight.destinationTo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18))
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Text("Rp.",
                              style: TextStyle(
                                  color: Color(0XFFE67E22),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15)),
                          Text(flight.price.toString(),
                              style: const TextStyle(
                                  color: Color(0XFFE67E22),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15)),
                          const Text('/pax',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15))
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.luggage),
                          const SizedBox(
                            width: 280,
                          ),
                          IconButton(
                              icon:
                                  const Icon(Icons.keyboard_arrow_right_sharp),
                              onPressed: () {
                                onFlightClicked(flight);
                              })
                        ],
                      ),
                    ],
                  ),
                )
              ])),
        ],
      );
}
