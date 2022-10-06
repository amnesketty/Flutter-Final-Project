import 'package:flutter/cupertino.dart';
import 'package:lounga/app/pages/hotel_get/hotel_get_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

class HotelGetPage extends View {
  HotelGetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final hotelGetController = Injector.appInstance.get<HotelGetController>();
    return _HotelGetViewState(hotelGetController);
  }
}

class _HotelGetViewState extends ViewState<HotelGetPage, HotelGetController> {
  _HotelGetViewState(super._controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('List of Hotel'),
        ),
        body: ControlledWidgetBuilder<HotelGetController>(
            builder: (BuildContext _, HotelGetController controller) =>
                controller.isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : ListView.builder(
                        itemCount: controller.hotels.length,
                        itemBuilder: (BuildContext _, int index) {
                          final hotels = controller.hotels[index];
                          return Text(hotels.photosHotel[0].image.toString());
                        })),
      );
}
