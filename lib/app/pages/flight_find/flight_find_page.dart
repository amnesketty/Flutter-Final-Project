import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

import 'flight_find_controller.dart';

class FlightFindPage extends View {
  FlightFindPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final flightFindController =
        Injector.appInstance.get<FlightFindController>();
    return _FlightFindViewState(flightFindController);
  }
}

class _FlightFindViewState
    extends ViewState<FlightFindPage, FlightFindController> {
  _FlightFindViewState(super._controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('Find Flight'),
        ),
        body: ControlledWidgetBuilder<FlightFindController>(
            builder: (BuildContext _, FlightFindController controller) =>
                controller.isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : ListView.builder(
                        itemCount: controller.flights.length,
                        itemBuilder: (BuildContext _, int index) {
                          final flights = controller.flights[index];
                          return Text(flights.aircraft);
                        })),
      );
}
