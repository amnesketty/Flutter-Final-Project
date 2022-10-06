import 'dart:ffi';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import '../../../domain/entities/user.dart';
import 'flight_search_controller.dart';

class FlightSearchPage extends View {
  static const route = '/flight-search';
  final User user;

  FlightSearchPage(this.user, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final flightSearchController =
        Injector.appInstance.get<FlightSearchController>();
    return _FlightSearchViewState(flightSearchController);
  }
}

class _FlightSearchViewState
    extends ViewState<FlightSearchPage, FlightSearchController> {
  _FlightSearchViewState(super._controller);
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(
      BuildContext context, FlightSearchController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Color(0XFFE67E22),
                onPrimary: Colors.white,
                surface: Color(0XFFE67E22),
                onSurface: Colors.white,
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    onChanged:
    (val) => controller.controllerdepartureDate.text = val;
    if (picked != null) {
      print(picked);
      selectedDate = picked;
      controller.changeDate(selectedDate.toString().substring(0, 10));
      //controller.controllerBookingDate.text = selectedDate.toString();
    }
  }

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('Flights - One Way Trip'),
          //leading: Icon(Icons.arrow_back),
          // actions: [Text("One Way Trip")],
          backgroundColor: const Color(0XFFE67E22),
        ),
        backgroundColor: const Color(0XFFD3D3D3),
        body: ControlledWidgetBuilder<FlightSearchController>(
          builder: (BuildContext context, FlightSearchController controller) =>
              Stack(children: [
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(
                      left: 10, top: 30, right: 10, bottom: 200),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ControlledWidgetBuilder<FlightSearchController>(
                    builder:
                        (BuildContext _, FlightSearchController controller) =>
                            Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          // margin: EdgeInsets.only(top: 10),
                          // height: MediaQuery.of(context).size.width * 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Destination From',
                                  style: TextStyle(
                                      color: Color(0XFFE67E22),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15)),
                              DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Transform.rotate(
                                        angle: 1.57,
                                        child: Icon(Icons.airplanemode_on)),
                                    // labelText: 'Destination From',
                                    fillColor: Colors.grey,
                                  ),
                                  value: controller.destinationFrom,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[0]),
                                      value: 0,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[1]),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[2]),
                                      value: 2,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[3]),
                                      value: 3,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[4]),
                                      value: 4,
                                    ),
                                  ],
                                  onChanged: (int? value) {
                                    controller.onChangedDropdownDestinationFrom(
                                        value!);
                                  },
                                  hint: Text("From")),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          // margin: EdgeInsets.only(top: 7),
                          // height: MediaQuery.of(context).size.width * 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Destination To',
                                  style: TextStyle(
                                      color: Color(0XFFE67E22),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15)),
                              DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Transform.rotate(
                                        angle: 1.57,
                                        child: Icon(Icons.airplanemode_on)),
                                    // labelText: 'Destination To',

                                    fillColor: Colors.grey,
                                  ),
                                  value: controller.destinationTo,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[0]),
                                      value: 0,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[1]),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[2]),
                                      value: 2,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[3]),
                                      value: 3,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(controller
                                          .dropdownvalueDestination[4]),
                                      value: 4,
                                    ),
                                  ],
                                  onChanged: (int? value) {
                                    controller
                                        .onChangedDropdownDestinationTo(value!);
                                  },
                                  hint: Text("From")),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(height: 9),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                const Text('Departure Date',
                                    style: TextStyle(
                                        color: Color(0XFFE67E22),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.84,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: () {
                                            _selectDate(context, controller);
                                          },
                                          child: Icon(
                                            Icons.calendar_month,
                                            size: 25,
                                          )),
                                      SizedBox(width: 5),
                                      Text(
                                        "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                        style: TextStyle(
                                            // fontWeight: FontWeight.w900,
                                            // fontSize: 20,
                                            ),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 30, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.8,
                                margin: EdgeInsets.only(
                                    left: 5, top: 15, right: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Passenger',
                                        style: TextStyle(
                                            color: Color(0XFFE67E22),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15)),
                                    TextFormField(
                                      controller:
                                          controller.controlleramountPassenger,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.people),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.007,
                                        ),
                                        Text('Seat Class',
                                            style: TextStyle(
                                                color: Color(0XFFE67E22),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15)),
                                        DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons
                                                  .airline_seat_recline_extra_sharp),
                                              // fillColor: Colors.grey,
                                            ),
                                            value: controller.seatClass,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text(controller
                                                    .dropdownvalueSeatClass[0]),
                                                value: 0,
                                              ),
                                              DropdownMenuItem(
                                                child: Text(controller
                                                    .dropdownvalueSeatClass[1]),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Text(controller
                                                    .dropdownvalueSeatClass[2]),
                                                value: 2,
                                              )
                                            ],
                                            onChanged: (int? value) {
                                              controller
                                                  .onChangedDropdownSeatClass(
                                                      value!);
                                            },
                                            hint: Text("Seat Class")),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 78,
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0)),
                                primary: const Color(0XFFE67E22)),
                            onPressed: () {
                              controller.searchFlight(
                                  controller.dropdownvalueSeatClass[
                                      controller.seatClass],
                                  controller.dropdownvalueDestination[
                                      controller.destinationFrom],
                                  controller.dropdownvalueDestination[
                                      controller.destinationTo],
                                  controller.controllerdepartureDate.text,
                                  int.parse(controller
                                      .controlleramountPassenger.text),
                                  widget.user);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.fromLTRB(
                                  25.0, 0.0, 25.0, 0.0),
                              child: const Text(
                                'Search',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            controller.isLoading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.2)),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFFE67E22),
                      ),
                    ))
                : const SizedBox(),
          ]),
        ),
        bottomNavigationBar: ControlledWidgetBuilder<FlightSearchController>(
            builder: (BuildContext _, FlightSearchController controller) =>
                BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: controller.bottomNavigationValue == 0
                            ? const Icon(Icons.home)
                            : const Icon(Icons.home_outlined),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: controller.bottomNavigationValue == 1
                            ? const Icon(Icons.receipt_long)
                            : const Icon(Icons.receipt_long_outlined),
                        label: 'My Order',
                      ),
                      BottomNavigationBarItem(
                        icon: controller.bottomNavigationValue == 2
                            ? const Icon(Icons.person)
                            : const Icon(Icons.person_outline),
                        label: 'My Account',
                      ),
                    ],
                    currentIndex: controller.bottomNavigationValue,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: const Color(0XFFE67E22),
                    unselectedItemColor: Colors.grey,
                    showUnselectedLabels: true,
                    showSelectedLabels: true,
                    onTap: (index) {
                      // controller.bottomNavigationMove(index, widget.user.token);
                    })),
      );
}
