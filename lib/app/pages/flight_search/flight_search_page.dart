import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'flight_search_controller.dart';

class FlightSearchPage extends View {
  FlightSearchPage({Key? key}) : super(key: key);

  @override
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
          leading: Icon(Icons.arrow_back),
          // actions: [Text("One Way Trip")],
          backgroundColor: const Color(0XFFE67E22),
        ),
        backgroundColor: const Color(0XFFD3D3D3),
        body: SingleChildScrollView(
          child: Container(
              margin:
                  EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ControlledWidgetBuilder<FlightSearchController>(
                builder: (BuildContext _, FlightSearchController controller) =>
                    Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 15, top: 15, right: 30, bottom: 10),
                      child: TextFormField(
                        controller: controller.controllerdestinationFrom,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: 'From',
                            //prefixIcon: Icon(Icons.email),
                            icon: Icon(Icons.airplanemode_on)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15, top: 15, right: 30, bottom: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.controllerdestinationTo,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: 'To',
                            //prefixIcon: Icon(Icons.email),
                            icon: Icon(Icons.airplanemode_on)),
                      ),
                    ),
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
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15, top: 1, right: 30, bottom: 10),
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
                            width: MediaQuery.of(context).size.width / 2.5,
                            margin: EdgeInsets.only(
                                left: 0, top: 15, right: 0, bottom: 10),
                            child: TextFormField(
                              controller: controller.controllerseatClass,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  labelText: 'Seat Class',
                                  //prefixIcon: Icon(Icons.email),
                                  icon: Icon(
                                      Icons.airline_seat_recline_extra_sharp)),
                            ),
                          )
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
                              controller.controllerseatClass.text,
                              controller.controllerdestinationFrom.text,
                              controller.controllerdestinationTo.text,
                              controller.controllerdepartureDate.text,
                              int.parse(
                                  controller.controlleramountPassenger.text));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                          child: TextButton(
                              onPressed: () {
                                controller.searchFlight(
                                    controller.controllerseatClass.text,
                                    controller.controllerdestinationFrom.text,
                                    controller.controllerdestinationTo.text,
                                    controller.controllerdepartureDate.text,
                                    int.parse(controller
                                        .controlleramountPassenger.text));
                              },
                              child: const Text(
                                'Search',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17),
                              )),
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
