import 'package:lounga/app/pages/hotel_detail/hotel_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import '../../../domain/entities/hotel.dart';
import '../../../domain/entities/user.dart';

class HotelDetailPage extends View {
  static const route = '/hotel-detail';

  final Hotel hotel;
  final User user;
  final String bookingDate;
  final int totalRoom;

  const HotelDetailPage(this.hotel, this.user, this.bookingDate, this.totalRoom,
      {Key? key})
      : super(key: key);

  @override
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
        foregroundColor: Colors.white,
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
                image: DecorationImage(
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
                        image: DecorationImage(
                            image: NetworkImage(photo), fit: BoxFit.cover),
                      ));
                },
              )),
          Row(children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Expanded(
              child: Container(
                  margin:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('HOTELS',
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
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      Text(widget.hotel.phone,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 7),
                      const Text('FACILITIES',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.air_rounded,
                              color:
                                  widget.hotel.facilitiesHotel.airConditioner ==
                                          true
                                      ? const Color(0XFFE67E22)
                                      : Colors.grey),
                          Icon(Icons.connected_tv_rounded,
                              color: widget.hotel.facilitiesHotel.television ==
                                      true
                                  ? const Color(0XFFE67E22)
                                  : Colors.grey),
                          Icon(Icons.wifi,
                              color: widget.hotel.facilitiesHotel.wifi == true
                                  ? const Color(0XFFE67E22)
                                  : Colors.grey),
                          Icon(Icons.food_bank_rounded,
                              color: widget.hotel.facilitiesHotel.restaurant ==
                                      true
                                  ? const Color(0XFFE67E22)
                                  : Colors.grey),
                          Icon(Icons.spa,
                              color: widget.hotel.facilitiesHotel.spa == true
                                  ? const Color(0XFFE67E22)
                                  : Colors.grey),
                          Icon(Icons.pool,
                              color: widget.hotel.facilitiesHotel.pool == true
                                  ? const Color(0XFFE67E22)
                                  : Colors.grey),
                          Icon(Icons.child_care_rounded,
                              color: widget.hotel.facilitiesHotel.playground ==
                                      true
                                  ? const Color(0XFFE67E22)
                                  : Colors.grey),
                          Icon(Icons.sports_gymnastics,
                              color: widget.hotel.facilitiesHotel.gym == true
                                  ? const Color(0XFFE67E22)
                                  : Colors.grey),
                          Icon(Icons.local_parking_rounded,
                              color:
                                  widget.hotel.facilitiesHotel.parking == true
                                      ? const Color(0XFFE67E22)
                                      : Colors.grey),
                        ],
                      ),
                      const Text('ROOMS',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 7),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.238,
                        width: MediaQuery.of(context).size.width * 0.92,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: ControlledWidgetBuilder<HotelDetailController>(
                            builder: (BuildContext context,
                                HotelDetailController controller) {
                          var typeRoom = <String>{};
                          List<RoomsHotel> uniqueTypeRoomList = widget
                              .hotel.roomsHotel
                              .where((element) => element.bookingHotels.isEmpty)
                              .where((room) => typeRoom.add(room.type))
                              .toList();
                          return ListView.builder(
                            itemCount: typeRoom.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                              margin: const EdgeInsets.all(7),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(uniqueTypeRoomList[index].type,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800)),
                                      Text(
                                          'Rp ${uniqueTypeRoomList[index].price}/room/night',
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
                                            widget.hotel,
                                            widget.user,
                                            widget.bookingDate,
                                            widget.totalRoom,
                                            uniqueTypeRoomList[index]);
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0XFFE67E22)),
                                      child: const Text('Choose',
                                          style:
                                              TextStyle(color: Colors.white)))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  )),
            )
          ]),
        ],
      ));
}
