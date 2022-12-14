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
  final String destinationFrom;
  final String destinationTo;
  final String seatClass;

  final int amountPassenger;
  const FlightFindPage(
      this.flights,
      this.user,
      this.departureDate,
      this.amountPassenger,
      this.destinationFrom,
      this.destinationTo,
      this.seatClass,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final flightFindController =
        Injector.appInstance.get<FlightFindController>();
    return _FlightFindViewState(flightFindController);
  }
}

class _FlightFindViewState
    extends ViewState<FlightFindPage, FlightFindController> {
  _FlightFindViewState(super.controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          backgroundColor: const Color(0XFFE67E22),
          foregroundColor: Colors.white,
          flexibleSpace: SafeArea(
              child: Column(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.010,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  Text(
                    widget.destinationFrom,
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text(widget.destinationTo,
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  Text(
                    widget.departureDate.substring(0, 10),
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  const Text('-', style: TextStyle(color: Colors.white)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text(widget.seatClass,
                      style: const TextStyle(color: Colors.white)),
                ],
              )
            ],
          )),
        ),
        backgroundColor: const Color(0XFFD3D3D3),
        body: ControlledWidgetBuilder<FlightFindController>(
            builder: (BuildContext _, FlightFindController controller) {
              var availableFlights = <String>{};
              List<Flight> availableFlightList = widget
                .flights
                .where((element) => element.amountPassenger < element.seatCapacity)
                .toList();
              return widget.flights.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.search_off_rounded,
                              size: 80,
                            ),
                            Text(
                              'No flights available',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: availableFlightList.length,
                        itemBuilder: (BuildContext _, int index) {
                          final flight = availableFlightList[index];
                          final price = availableFlightList[index].price;
                          return FlightTile(
                            flight: flight,
                            onFlightClicked: (Flight flight) {
                              controller.navigateToFlightDetail(
                                  flight,
                                  widget.user,
                                  widget.departureDate,
                                  widget.amountPassenger,
                                  price,
                                  widget.destinationFrom,
                                  widget.destinationTo,
                                  widget.seatClass);
                            },
                          );
                        });
            }),
      );
}
