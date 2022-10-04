import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/hotel_detail/hotel_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

import '../../../domain/entities/hotel.dart';
import '../../../domain/entities/user.dart';
import '../../widgets/hotel_tile.dart';

class HotelDetailPage extends View {
  static const route = '/hotel-detail';

  final Hotel hotel;
  final User user;
  final String bookingDate;
  final int totalRoom;

  const HotelDetailPage(this.hotel, this.user, this.bookingDate, this.totalRoom, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final hotelDetailController =
        Injector.appInstance.get<HotelDetailController>();
    return _HotelDetailViewState(hotelDetailController);
  }
}

class _HotelDetailViewState
    extends ViewState<HotelDetailPage, HotelDetailController> {
  _HotelDetailViewState(super.controller);
  @override
  Widget get view => Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: const Color(0XFFE67E22),
        centerTitle: true,
        title: Text(widget.hotel.name),
      ),
      backgroundColor: const Color(0XFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: BoxDecoration(
                // ignore: unnecessary_new
                image: new DecorationImage(
                    image: NetworkImage(widget.hotel.photosHotel.first.image),
                    fit: BoxFit.cover),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.hotel.photosHotel.length - 1,
                itemBuilder: (BuildContext _, int index) {
                  final photo = widget.hotel.photosHotel[index + 1].image;
                  return Container(
                      width: MediaQuery.of(context).size.width * 0.33333,
                      decoration: BoxDecoration(
                        // ignore: unnecessary_new
                        image: new DecorationImage(
                            image: NetworkImage(photo), fit: BoxFit.cover),
                      ));
                },
              )),
          Row(children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('HOTELS',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.grey, size: 18),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.88,
                          child: Text(widget.hotel.address,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Text(widget.hotel.phone,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 7),
                    const Text('FACILITIES',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 7),
                    Text(
                        widget.hotel.facilitiesHotel.airConditioner.toString()),
                    const Text('ROOMS',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 7),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.92,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: const EdgeInsets.all(7),
                          child: ControlledWidgetBuilder<HotelDetailController>(
                            builder: (BuildContext context, HotelDetailController controller) =>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(widget.hotel.roomsHotel.first.type,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800)),
                                      Text(
                                      'Rp ${widget.hotel.roomsHotel.first.price}/room/night',
                                      // textAlign: TextAlign.right,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0XFFE67E22))),
                                    ],
                                  ),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        controller.navigateToHotelBooking(
                                          widget.hotel, widget.user, widget.bookingDate,
                                          widget.totalRoom, widget.hotel.roomsHotel.first.price, widget.hotel.roomsHotel.first.id);
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: const Color(0XFFE67E22)),
                                      child: const Text('Choose',
                                          style:
                                              TextStyle(color: Colors.white)))
                                ],
                              ),
                            ],
                          ),
                        )
                        ,)
                    ),
                  ],
                ))
          ]),
        ],
      ));
}
