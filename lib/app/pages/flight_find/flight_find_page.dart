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
  const FlightFindPage(this.flights, this.user, this.departureDate, {Key? key})
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
          title: const Text('List of Booked Flights'),
        ),
        backgroundColor: const Color(0XFFD3D3D3),
        body: ControlledWidgetBuilder<FlightFindController>(
            builder: (BuildContext _, FlightFindController controller) =>
                controller.isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : ListView.builder(
                        itemCount: widget.flights.length,
                        itemBuilder: (BuildContext _, int index) {
                          final flight = widget.flights[index];
                          final price = widget.flights[index].price;
                          return FlightTile(
                            flight: flight,
                            onFlightClicked: (Flight flight) {
                              controller.navigateToFlightDetail(flight, widget.user, widget.departureDate);
                            },
                          );
                        })),
      );
}
