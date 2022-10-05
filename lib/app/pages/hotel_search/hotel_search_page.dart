// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:lounga/app/widgets/hotel_tile.dart';

import '../../../domain/entities/hotel.dart';
import '../../../domain/entities/user.dart';
import 'hotel_search_controller.dart';

class HotelSearchPage extends View {
  static const route = '/hotel-search';
  final User user;

  const HotelSearchPage(this.user, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final hotelSearchController =
        Injector.appInstance.get<HotelSearchController>();
    return _HotelSearchViewState(hotelSearchController);
  }
}

class _HotelSearchViewState
    extends ViewState<HotelSearchPage, HotelSearchController> {
  _HotelSearchViewState(super._controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('HOTELS'),
          // leading: const Icon(Icons.arrow_back),
          // actions: [Text("One Way Trip")],
          backgroundColor: const Color(0XFFE67E22),
        ),
        backgroundColor: const Color(0XFFD3D3D3),
        body: ListView(
          children: [Container(
              margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
                    child: 
                      ControlledWidgetBuilder<HotelSearchController>(
                        builder: (BuildContext context, HotelSearchController controller) =>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text('City',
                            style:
                                TextStyle(
                                    color: Color(0XFFE67E22),
                                    fontWeight: FontWeight.w700,
                                  fontSize: 18)),
                          TextFormField(
                            controller: controller.controllerCity,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: 'City',
                                labelStyle: 
                                  const TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:Color(0XFFE67E22))),
                            )),
                          const SizedBox(height: 20),
                          const Text('Booking Date',
                            style:
                                TextStyle(
                                    color: Color(0XFFE67E22),
                                    fontWeight: FontWeight.w700,
                                  fontSize: 18)),
                          TextFormField(
                            controller: controller.controllerBookingDate,
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_month, color: Colors.black),
                                prefixIconConstraints: BoxConstraints(maxWidth: 40),
                                // icon: Icon(Icons.calendar_month),
                                hintText: 'Booking Date',
                                labelStyle: 
                                  const TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:Color(0XFFE67E22))),
                            )),
                          const SizedBox(height: 20),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.32,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text('Room',
                                      style:
                                          TextStyle(
                                              color: Color(0XFFE67E22),
                                              fontWeight: FontWeight.w700,
                                            fontSize: 18)),
                                    TextFormField(
                                      controller: controller.controllerRoom,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.door_back_door, color: Colors.black),
                                          prefixIconConstraints: BoxConstraints(maxWidth: 40),
                                          // icon: Icon(Icons.calendar_month),
                                          hintText: '1 Room(s)',
                                          labelStyle: 
                                            const TextStyle(color: Colors.black),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:Color(0XFFE67E22))),
                                      )),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.32,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text('Duration',
                                      style:
                                          TextStyle(
                                              color: Color(0XFFE67E22),
                                              fontWeight: FontWeight.w700,
                                            fontSize: 18)),
                                    TextFormField(
                                      controller: controller.controllerDuration,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.access_alarm_rounded, color: Colors.black),
                                          prefixIconConstraints: BoxConstraints(maxWidth: 40),
                                          // icon: Icon(Icons.calendar_month),
                                          hintText: '1 Night(s)',
                                          labelStyle: 
                                            const TextStyle(color: Colors.black),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:Color(0XFFE67E22))),
                                      )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height:60),
                          TextButton(
                            onPressed: () {
                              controller.searchHotels(
                              controller.controllerCity.text, 
                              controller.controllerBookingDate.text, 
                              int.parse(controller.controllerRoom.text), 
                              int.parse(controller.controllerDuration.text),
                              widget.user
                              );
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0XFFE67E22),
                                minimumSize: const Size.fromHeight(40)),
                            child: const Text('Search',
                                style:
                                    TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ))),
                        ],
                      ),
                  ),
              )],
              )
            ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // currentIndex: _currentIndex,
          // onTap: _updateIndex,
          selectedItemColor: Color(0XFFE67E22),
          selectedFontSize: 13,
          unselectedFontSize: 13,
          iconSize: 30,
          // ignore: prefer_const_literals_to_create_immutables
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
