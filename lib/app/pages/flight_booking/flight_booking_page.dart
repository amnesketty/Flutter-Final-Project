import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/flight.dart';

import '../../../domain/entities/user.dart';
import '../../widgets/pop_up_dialog.dart';
import '../../widgets/text_field.dart';
import 'flight_booking_controller.dart';

class FlightBookingPage extends View {
  static const route = '/flight-booking';

  final Flight flight;
  final User user;
  final String departureDate;
  final int amountPassenger;
  final int price;
  const FlightBookingPage(this.flight, this.user, this.departureDate, this.amountPassenger, this.price,
      {Key? key})
      : super(key: key);

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
  final int _value = 1;
  @override
  Widget get view => Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: const Color(0XFFE67E22),
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text('FILL IN DETAILS'),
      ),
      backgroundColor: const Color(0XFFFFFFFF),
      body: ControlledWidgetBuilder<FlightBookingController>(
        builder: (BuildContext context, FlightBookingController controller) =>
        Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.27,
                    color: const Color(0XFFE67E22),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Your Booking Summary',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.airplane_ticket_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              // Day,Month Date,Year
                              DateFormat.yMMMEd().format(
                                  DateTime.parse(widget.departureDate)),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(widget.flight.airline,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.flight.destinationFrom,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.flight.destinationTo,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                                TimeOfDay(
                                        hour: int.parse(widget.flight.departureTime
                                            .substring(11, 13)),
                                        minute: int.parse(widget
                                            .flight.departureTime
                                            .substring(14, 16)))
                                    .format(context),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                TimeOfDay(
                                        hour: int.parse(widget.flight.arrivalTime
                                            .substring(11, 13)),
                                        minute: int.parse(widget.flight.arrivalTime
                                            .substring(14, 16)))
                                    .format(context),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.flight.seatClass,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),
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
                                DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(5))),
                                    ),
                                    value: controller.valueDropdownTitle,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Mr."),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Ms."),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Mrs."),
                                        value: 3,
                                      )
                                    ],
                                    onChanged: (int? value) {
                                      controller.onChangedDropdownTitle(value!);
                                    },
                                    hint: Text("Select item")),
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
                                  textLabel: "Id Card Number",
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.1),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: TextButton(
                                      onPressed: () async {
                                        controller.bookFlight(
                                            controller.controllerTitle.text,
                                            controller.controllerName.text,
                                            controller.controllerIdCard.text,
                                            widget.flight,
                                            widget.user,
                                            widget.departureDate,
                                            widget.amountPassenger,
                                            widget.price
                                            );
                                        do {
                                          await Future.delayed(const Duration(milliseconds: 100));
                                        } while (controller.isLoading);
                                        
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) => 
                                              PopUpDialog(function: () {controller.navigateToHomePage(widget.user);}, tipePopUpDialog: "bookingSuccess", popUpButton: "bookingSuccess")
                                          );
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: const Color(0XFFE67E22)),
                                      child: const Text('BOOK FLIGHT',
                                          style: TextStyle(color: Colors.white))),
                                )
                              ],
                            )))
              ],
            ),
          ),
          controller.isLoading ? 
              Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2)
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color(0XFFE67E22),
                ),))
              : const SizedBox(),
        ],
      )));
}
