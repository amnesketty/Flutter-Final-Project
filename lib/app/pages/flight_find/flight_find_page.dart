import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:lounga/app/widgets/flight_tile.dart';

import '../../../domain/entities/flight.dart';
import '../../../domain/entities/user.dart';
import 'flight_find_controller.dart';

class FlightFindPage extends View {
  static const route = '/flight-find';

  final List<Flight> flights;
  final User user;
  final String departureDate;
  final int amountPassenger;
  const FlightFindPage(
      this.flights, this.user, this.departureDate, this.amountPassenger,
      {Key? key})
      : super(key: key);

  // FlightFindPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final flightFindController =
        Injector.appInstance.get<FlightFindController>();
    return _FlightFindViewState(flightFindController);
  }
}

class _FlightFindViewState
    extends ViewState<FlightFindPage, FlightFindController> {
  _FlightFindViewState(super._controller);

  @override
  Widget get view => Scaffold(
    key: globalKey,
    appBar: AppBar(
      backgroundColor: const Color(0XFFE67E22),
      title: const Text('List of Flights'),
    ),
    backgroundColor: const Color(0XFFD3D3D3),
    body: ControlledWidgetBuilder<FlightFindController>(
        builder: (BuildContext _, FlightFindController controller) =>
            widget.flights.length == 0
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.search_off_rounded,
                        size: 80,),
                      const Text('No flights available',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),)
                    ],
                  ),
                )
                : ListView.builder(
                    itemCount: widget.flights.length,
                    itemBuilder: (BuildContext _, int index) {
                      final flight = widget.flights[index];
                      final price = widget.flights[index].price;
                      return FlightTile(
                        flight: flight,
                        onFlightClicked: (Flight flight) {
                          controller.navigateToFlightDetail(
                              flight,
                              widget.user,
                              widget.departureDate,
                              widget.amountPassenger,
                              price);
                        },
                      );
                    })),
  );
}
