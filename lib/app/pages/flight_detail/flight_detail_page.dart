import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../domain/entities/flight.dart';
import '../../../domain/entities/user.dart';
import 'flight_detail_controller.dart';

class FlightDetailPage extends View {
  static const route = '/flight-detail';
  final Flight flight;
  final User user;
  final String departureDate;
  final int amountPassenger;
  final int price;
  const FlightDetailPage(this.flight, this.user, this.departureDate,
      this.amountPassenger, this.price,
      {Key? key})
      : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final flightDetailController =
        Injector.appInstance.get<FlightDetailController>();
    return _FlightDetailViewState(flightDetailController);
  }
}

class _FlightDetailViewState
    extends ViewState<FlightDetailPage, FlightDetailController> {
  _FlightDetailViewState(super.controller);
  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          backgroundColor: const Color(0XFFE67E22),
          centerTitle: true,
          title: Text(widget.flight.airline),
        ),
        backgroundColor: const Color(0XFFD3D3D3),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.flight.destinationFrom,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const Icon(Icons.arrow_right_alt),
                Text(
                  widget.flight.destinationTo,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.52,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 70,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                            TimeOfDay(
                                    hour: int.parse(widget.flight.departureTime
                                        .substring(11, 13)),
                                    minute: int.parse(widget
                                        .flight.departureTime
                                        .substring(14, 16)))
                                .format(context),
                            style:
                                // ignore: prefer_const_constructors
                                TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 155,
                        ),
                        Text(
                          'duration',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        const SizedBox(
                          height: 155,
                        ),
                        Text(
                            TimeOfDay(
                                    hour: int.parse(widget.flight.arrivalTime
                                        .substring(11, 13)),
                                    minute: int.parse(widget.flight.arrivalTime
                                        .substring(14, 16)))
                                .format(context),
                            style:
                                // ignore: prefer_const_constructors
                                TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5, top: 40, bottom: 45, right: 10),
                    child: const StepProgressIndicator(
                      totalSteps: 2,
                      currentStep: 1,
                      size: 3,
                      direction: Axis.vertical,
                      progressDirection: TextDirection.rtl,
                      selectedColor: const Color(0XFFE67E22),
                      unselectedColor: Colors.grey,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 28,
                        ),
                        Text(
                          widget.flight.destinationFrom,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.38,
                          width: MediaQuery.of(context).size.width * 0.76,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.airplanemode_active_sharp),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.flight.airline,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    widget.flight.aircraft,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '~',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.flight.seatClass,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.luggage,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Cabbin baggage ${widget.flight.facilitiesFlight.cabinBaggage} kg',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    'Baggage ${widget.flight.facilitiesFlight.baggage} kg',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.tv_off,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'In-flight entertainment not available',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.wifi_off,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'WiFi not available',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.power_off,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Power/USB port not available',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.flight.aircraftsType,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    widget.flight.seatLayout,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    widget.flight.seatPitch,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.flight.destinationTo,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SizedBox(
                  width: 6,
                ),
                Icon(Icons.payment),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Price Details',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text('Passengers (x${widget.amountPassenger})'),
                      Spacer(),
                      Text('Rp${widget.flight.price}')
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [Text('Tax'), Spacer(), Text('Included')],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              height: 100,
              color: Colors.white,
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              height: 55,
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp${widget.flight.price * widget.amountPassenger}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color(0XFFE67E22)),
                      ),
                      Text(
                        '/pax',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Spacer(),
                  // ControlledWidgetBuilder<FlightBookingController>(
                  //     builder: (BuildContext context,
                  //             FlightBookingController controller) =>
                  Container(
                      margin: EdgeInsets.only(right: 2, top: 2, bottom: 2),
                      child: ControlledWidgetBuilder<FlightDetailController>(
                        builder: (BuildContext context,
                                FlightDetailController controller) =>
                            ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0XFFE67E22),
                          ),
                          onPressed: () {
                            controller.navigateToFlightBooking(
                                widget.flight,
                                widget.user,
                                widget.departureDate,
                                widget.amountPassenger,
                                widget.price);
                          },
                          child: const Text(
                            'Select',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      );
}
