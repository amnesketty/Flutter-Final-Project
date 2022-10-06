import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/user.dart';
import 'hotel_search_controller.dart';

class HotelSearchPage extends View {
  static const route = '/hotel-search';
  final User user;

  const HotelSearchPage(this.user, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    final hotelSearchController =
        Injector.appInstance.get<HotelSearchController>();
    return _HotelSearchViewState(hotelSearchController);
  }
}

class _HotelSearchViewState
    extends ViewState<HotelSearchPage, HotelSearchController> {
  _HotelSearchViewState(super.controller);

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(
      BuildContext context, HotelSearchController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Color(0XFFE67E22),
                onPrimary: Colors.white,
                surface: Color(0XFFE67E22),
                onSurface: Colors.white,
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      print(picked);
      selectedDate = picked;
      controller.changeDate(
          DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(selectedDate));
    }
  }

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('HOTELS'),
          backgroundColor: const Color(0XFFE67E22),
        ),
        backgroundColor: const Color(0XFFD3D3D3),
        body: ControlledWidgetBuilder<HotelSearchController>(
          builder: (BuildContext context, HotelSearchController controller) =>
              Stack(
            children: [
              ListView(children: [
                Container(
                    margin: const EdgeInsets.only(
                        left: 10, top: 20, right: 10, bottom: 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, top: 15, right: 15, bottom: 10),
                          child: ControlledWidgetBuilder<HotelSearchController>(
                            builder: (BuildContext context,
                                    HotelSearchController controller) =>
                                Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('City',
                                    style: TextStyle(
                                        color: Color(0XFFE67E22),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                DropdownButtonFormField(
                                    value: controller.city,
                                    items: [
                                      DropdownMenuItem(
                                        value: 0,
                                        child:
                                            Text(controller.dropdownvalue[0]),
                                      ),
                                      DropdownMenuItem(
                                        value: 1,
                                        child:
                                            Text(controller.dropdownvalue[1]),
                                      ),
                                      DropdownMenuItem(
                                        value: 2,
                                        child:
                                            Text(controller.dropdownvalue[2]),
                                      ),
                                      DropdownMenuItem(
                                        value: 3,
                                        child:
                                            Text(controller.dropdownvalue[3]),
                                      ),
                                      DropdownMenuItem(
                                        value: 4,
                                        child:
                                            Text(controller.dropdownvalue[4]),
                                      ),
                                    ],
                                    onChanged: (int? value) {
                                      controller.onChangedDropdownCity(value!);
                                    },
                                    hint: const Text("City")),
                                const SizedBox(height: 20),
                                const Text('Booking Date',
                                    style: TextStyle(
                                        color: Color(0XFFE67E22),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                const SizedBox(height: 9),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: () {
                                            _selectDate(context, controller);
                                          },
                                          child: const Icon(
                                            Icons.calendar_month,
                                            size: 25,
                                          )),
                                      const SizedBox(width: 5),
                                      Text("${selectedDate.toLocal()}"
                                          .split(' ')[0]),
                                      const Spacer()
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Room',
                                              style: TextStyle(
                                                  color: Color(0XFFE67E22),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18)),
                                          TextFormField(
                                              controller:
                                                  controller.controllerRoom,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: const InputDecoration(
                                                prefixIcon: Icon(
                                                    Icons.door_back_door,
                                                    color: Colors.black),
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                        maxWidth: 40),
                                                hintText: '1 Room(s)',
                                                labelStyle: TextStyle(
                                                    color: Colors.black),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0XFFE67E22))),
                                              )),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Duration',
                                              style: TextStyle(
                                                  color: Color(0XFFE67E22),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18)),
                                          TextFormField(
                                              controller:
                                                  controller.controllerDuration,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: const InputDecoration(
                                                prefixIcon: Icon(
                                                    Icons.access_alarm_rounded,
                                                    color: Colors.black),
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                        maxWidth: 40),
                                                hintText: '1 Night(s)',
                                                labelStyle: TextStyle(
                                                    color: Colors.black),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0XFFE67E22))),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 60),
                                TextButton(
                                    onPressed: () {
                                      controller.searchHotels(
                                          controller
                                              .dropdownvalue[controller.city],
                                          controller.controllerBookingDate.text,
                                          int.parse(
                                              controller.controllerRoom.text),
                                          int.parse(controller
                                              .controllerDuration.text),
                                          widget.user);
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0XFFE67E22),
                                        minimumSize: const Size.fromHeight(40)),
                                    child: const Text('Search',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                        ))),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ]),
              controller.isLoading
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.2)),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0XFFE67E22),
                        ),
                      ))
                  : const SizedBox(),
            ],
          ),
        ),
        bottomNavigationBar: ControlledWidgetBuilder<HotelSearchController>(
            builder: (BuildContext _, HotelSearchController controller) =>
                BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: controller.bottomNavigationValue == 0
                            ? const Icon(Icons.home)
                            : const Icon(Icons.home_outlined),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: controller.bottomNavigationValue == 1
                            ? const Icon(Icons.receipt_long)
                            : const Icon(Icons.receipt_long_outlined),
                        label: 'My Order',
                      ),
                      BottomNavigationBarItem(
                        icon: controller.bottomNavigationValue == 2
                            ? const Icon(Icons.person)
                            : const Icon(Icons.person_outline),
                        label: 'My Account',
                      ),
                    ],
                    currentIndex: controller.bottomNavigationValue,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: const Color(0XFFE67E22),
                    unselectedItemColor: Colors.grey,
                    showUnselectedLabels: true,
                    showSelectedLabels: true,
                    onTap: (index) {})),
      );
}
