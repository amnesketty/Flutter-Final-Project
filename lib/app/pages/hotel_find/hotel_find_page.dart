import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/hotel_find/hotel_find_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

import '../../../domain/entities/hotel.dart';
import '../../widgets/hotel_tile.dart';

class HotelFindPage extends View {
  static const route = '/hotel-find';
  final List<Hotel> hotels;
  const HotelFindPage(this.hotels, {Key? key}) : super(key: key);
  
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final hotelFindController = Injector.appInstance.get<HotelFindController>();
    return _HotelFindViewState(hotelFindController);
  }
}

class _HotelFindViewState extends ViewState<HotelFindPage, HotelFindController> {
  _HotelFindViewState(super.controller);

  @override
  Widget get view => Scaffold(
    key: globalKey,
    appBar: AppBar(
      backgroundColor: const Color(0XFFE67E22),
      title: const Text('List of Hotels'),
    ),
    backgroundColor: const Color(0XFFD3D3D3),
    body: ControlledWidgetBuilder<HotelFindController>(
      builder: (BuildContext _, HotelFindController controller) =>
        controller.isLoading
        ? const Center(child: CupertinoActivityIndicator())
        : ListView.builder(
          //shrinkWrap: true,
          itemCount: widget.hotels.length,            
          itemBuilder: (BuildContext _, int index) {
            final hotel = widget.hotels[index];
            final room = hotel.roomsHotel.first.price.toString();
            // return Text(rooms);
            return HotelTile(
              hotel: hotel,
              onHotelClicked: (Hotel hotel) {
                controller.navigateToHotelDetail(hotel);
              },
              );
          }
        )),
  );
}