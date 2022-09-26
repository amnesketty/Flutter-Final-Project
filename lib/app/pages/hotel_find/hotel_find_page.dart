import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/hotel_find/hotel_find_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

class HotelFindPage extends View {
  HotelFindPage({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    final hotelFindController = Injector.appInstance.get<HotelFindController>();
    return _HotelFindViewState(hotelFindController);
  }
}

class _HotelFindViewState extends ViewState<HotelFindPage, HotelFindController> {
  _HotelFindViewState(super._controller);

  @override
  Widget get view => Scaffold(
    key: globalKey,
    appBar: AppBar(
      title: const Text('List of Booked Hotels'),
    ),
    body: ControlledWidgetBuilder<HotelFindController>(
      builder: (BuildContext _, HotelFindController controller) =>
        controller.isLoading
        ? const Center(child: CupertinoActivityIndicator())
        : ListView.builder(
          itemCount: controller.hotels.length,
          itemBuilder: (BuildContext _, int index) {
            final hotels = controller.hotels[index];
            return Text(hotels.name);
          }
        )),
  );
}