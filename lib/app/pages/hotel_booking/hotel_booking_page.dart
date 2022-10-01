
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

import '../../../domain/entities/hotel.dart';
import '../../widgets/hotel_tile.dart';
import '../../widgets/text_field.dart';
import 'hotel_booking_controller.dart';

class HotelBookingPage extends View {
  static const route = '/hotel-booking';

  final Hotel hotel;

  const HotelBookingPage(this.hotel, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final hotelBookingController =
        Injector.appInstance.get<HotelBookingController>();
    return _HotelBookingViewState(hotelBookingController);
  }
}

class _HotelBookingViewState
    extends ViewState<HotelBookingPage, HotelBookingController> {
  _HotelBookingViewState(super.controller);
  @override
  Widget get view => Scaffold(
      key: globalKey,
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
              height: MediaQuery.of(context).size.height * 0.2,
              color: const Color(0XFFE67E22),
              child: 
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(height: 15),
                        Text('Your Booking Summary', style: 
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900)),
                        SizedBox(height: 5),
                        Row(children: [
                          Icon(Icons.airline_seat_individual_suite_rounded),
                          SizedBox(width:5),
                          Text(widget.hotel.name, style: 
                            TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900)),
                        ]),
                        SizedBox(height: 5),
                        // ignore: prefer_const_literals_to_create_immutables
                        Row(children: [
                          Text('Check-in', style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                          Text('Saturday, 31-Dec-2022 (14:00)', style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900))
                        ]),
                        SizedBox(height: 5),
                        // ignore: prefer_const_literals_to_create_immutables
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Check-out', style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                          // Spacer(),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                          Text('Sunday, 1-Jan-2023 (12:00)', style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900))
                        ]),
                        SizedBox(height: 5),
                        Row(children: [
                          Text('1x', style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                          Text(widget.hotel.roomsHotel.first.type, style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900))
                        ]),
                        SizedBox(height: 5),
                        Row(children: [
                          Text('1x', style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                          Text('Room(s)', style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900))
                        ]),
                      ],

                    )
                
              ],)

              
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.62,
              color: Colors.white,
              child: 
                ControlledWidgetBuilder<HotelBookingController>(
                  builder: (BuildContext context, HotelBookingController controller) =>
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
                    const Text("Contact's Name",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      )), 
                    const SizedBox(height: 7),
                    TextFieldCustome(textEditingController: controller.controllerContactName, textLabel: "Contact's Name"),
                    const SizedBox(height: 10),
                    const Text("Email",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      )), 
                    const SizedBox(height: 7),
                    TextFieldCustome(textEditingController: controller.controllerEmail, textLabel: "Email"),
                    const SizedBox(height: 10),
                    const Text("Phone",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      )), 
                    const SizedBox(height: 7),
                    TextFieldCustome(textEditingController: controller.controllerPhone, textLabel: "Phone"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0XFFE67E22)),
                        child: const Text('BOOK HOTEL',
                            style:
                                TextStyle(color: Colors.white))),
                    )
                ],))
            )
          ],
        ),
      ));
}
