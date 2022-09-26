import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

import 'flight_get_controller.dart';

class FlightGetPage extends View {
  FlightGetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final flightGetController = Injector.appInstance.get<FlightGetController>();
    return _FlightGetViewState(flightGetController);
  }
}

class _FlightGetViewState
    extends ViewState<FlightGetPage, FlightGetController> {
  _FlightGetViewState(super._controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('Flight'),
        ),
        body: ControlledWidgetBuilder<FlightGetController>(
            builder: (BuildContext _, FlightGetController controller) =>
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
