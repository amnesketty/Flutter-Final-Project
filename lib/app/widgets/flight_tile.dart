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
                        Icon(Icons.airplanemode_on),
                        SizedBox(
                          width: 10,
                        ),
                        Text(flight.airline,
                            style:
                                // ignore: prefer_const_constructors
                                TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18)),
                      ]),

                      // ignore: prefer_const_literals_to_create_immutables
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
                                style:
                                    // ignore: prefer_const_constructors
                                    TextStyle(
                                        color: Colors.black, fontSize: 13)),
                            SizedBox(
                              width: 10,
                            ),
                            Text("-"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                TimeOfDay(
                                        hour: int.parse(flight.arrivalTime
                                            .substring(11, 13)),
                                        minute: int.parse(flight.arrivalTime
                                            .substring(14, 16)))
                                    .format(context),
                                style:
                                    // ignore: prefer_const_constructors
                                    TextStyle(
                                        color: Colors.black, fontSize: 13)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(flight.destinationFrom.toString(),
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_right_alt_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(flight.destinationTo.toString(),
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(color: Colors.black, fontSize: 18))
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text("Rp.",
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(
                                      color: const Color(0XFFE67E22),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15)),
                          Text(flight.price.toString(),
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(
                                      color: const Color(0XFFE67E22),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15)),
                          Text('/pax',
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.luggage),
                          SizedBox(
                            width: 280,
                          ),
                          IconButton(
                              icon: Icon(Icons.keyboard_arrow_right_sharp),
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
