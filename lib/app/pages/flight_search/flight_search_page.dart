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
        body: SingleChildScrollView(
          child: Container(
              margin:
                  EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ControlledWidgetBuilder<FlightSearchController>(
                builder: (BuildContext _, FlightSearchController controller) =>
                    Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      // margin: EdgeInsets.only(top: 10),
                      // height: MediaQuery.of(context).size.width * 2.5,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: 'Destination From',
                            icon: Icon(
                              Icons.airplanemode_on,
                            ),
                            fillColor: Colors.grey,
                          ),
                          value: controller.destinationFrom,
                          items: [
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[0]),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[1]),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[2]),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[3]),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[4]),
                              value: 4,
                            ),
                          ],
                          onChanged: (int? value) {
                            controller.onChangedDropdownDestinationFrom(value!);
                          },
                          hint: Text("From")),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      // margin: EdgeInsets.only(top: 7),
                      // height: MediaQuery.of(context).size.width * 2.5,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: 'Destination To',
                            icon: Icon(Icons.airplanemode_on),
                            fillColor: Colors.grey,
                          ),
                          value: controller.destinationTo,
                          items: [
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[0]),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[1]),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[2]),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[3]),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(controller.dropdownvalueDestination[4]),
                              value: 4,
                            ),
                          ],
                          onChanged: (int? value) {
                            controller.onChangedDropdownDestinationTo(value!);
                          },
                          hint: Text("From")),
                    ),
                    /*
                    Container(
                      margin: EdgeInsets.only(
                          left: 15, top: 15, right: 30, bottom: 10),
                      child: TextFormField(
                        controller: controller.controllerdepartureDate,
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: 'Departure Date',
                            //prefixIcon: Icon(Icons.email),
                            icon: Icon(Icons.calendar_month)),
                      ),
                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: DateTimePicker(
                        //controller: controller.controllerdepartureDate,

                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.calendar_month),
                        dateLabelText: 'Departure Date',
                        // selectableDayPredicate: (date) {
                        //   // Disable weekend days to select from the calendar
                        //   if (date.weekday == 6 || date.weekday == 7) {
                        //     return false;
                        //   }

                        //   return true;
                        // },
                        onChanged: (val) =>
                            controller.controllerdepartureDate.text = val,
                        validator: (val) {
                          controller.controllerdepartureDate.text = val!;
                          return null;
                        },
                        onSaved: (val) =>
                            controller.controllerdepartureDate.text = val!,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 30, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            margin: EdgeInsets.only(
                                left: 0, top: 15, right: 0, bottom: 10),
                            child: TextFormField(
                              controller: controller.controlleramountPassenger,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  labelText: 'Passengers',
                                  //prefixIcon: Icon(Icons.email),
                                  icon: Icon(Icons.people)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              children: [
                                DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Seat Class',
                                      icon: Icon(Icons
                                          .airline_seat_recline_normal_rounded),
                                      fillColor: Colors.grey,
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
                                          .onChangedDropdownSeatClass(value!);
                                    },
                                    hint: Text("Seat Class")),
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
                              controller
                                  .dropdownvalueSeatClass[controller.seatClass],
                              controller.dropdownvalueDestination[
                                  controller.destinationFrom],
                              controller.dropdownvalueDestination[
                                  controller.destinationTo],
                              controller.controllerdepartureDate.text,
                              int.parse(
                                  controller.controlleramountPassenger.text),
                              widget.user);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // currentIndex: _currentIndex,
          // onTap: _updateIndex,
          selectedItemColor: Color(0XFFE67E22),
          selectedFontSize: 13,
          unselectedFontSize: 13,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "My Order",
              icon: Icon(Icons.note),
            ),
            BottomNavigationBarItem(
              label: "My Account",
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
      );
}
