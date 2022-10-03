import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

import '../../../domain/entities/flight.dart';

import '../../widgets/text_field.dart';
import 'flight_booking_controller.dart';

class FlightBookingPage extends View {
  static const route = '/flight-booking';

  final Flight flight;

  const FlightBookingPage(this.flight, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final flightBookingController =
        Injector.appInstance.get<FlightBookingController>();
    return _FlightBookingViewState(flightBookingController);
  }
}

class _FlightBookingViewState
    extends ViewState<FlightBookingPage, FlightBookingController> {
  _FlightBookingViewState(super.controller);
  @override
  Widget get view => Scaffold(
      //key: globalKey,
      appBar: AppBar(
        backgroundColor: const Color(0XFFE67E22),
        centerTitle: true,
        title: Text('FILL IN DETAILS'),
      ),
      backgroundColor: const Color(0XFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.27,
                color: const Color(0XFFE67E22)),
            Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.62,
                color: Colors.white,
                child: ControlledWidgetBuilder<FlightBookingController>(
                    builder: (BuildContext context,
                            FlightBookingController controller) =>
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('CONTACT DETAILS',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                )),
                            const SizedBox(height: 15),
                            const Text("Title",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                )),
                            const SizedBox(height: 7),
                            TextFieldCustome(
                                textEditingController:
                                    controller.controllerTitle,
                                textLabel: "Mr/Mrs/Ms"),
                            const SizedBox(height: 10),
                            const Text("Name",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                )),
                            const SizedBox(height: 7),
                            TextFieldCustome(
                                textEditingController:
                                    controller.controllerName,
                                textLabel: "Contact's Name"),
                            const SizedBox(height: 10),
                            const Text("Id Card",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                )),
                            const SizedBox(height: 7),
                            TextFieldCustome(
                                textEditingController:
                                    controller.controllerIdCard,
                                textLabel: "Id Card Number"),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0XFFE67E22)),
                                  child: const Text('BOOK FLIGHT',
                                      style: TextStyle(color: Colors.white))),
                            )
                          ],
                        )))
          ],
        ),
      ));
}
