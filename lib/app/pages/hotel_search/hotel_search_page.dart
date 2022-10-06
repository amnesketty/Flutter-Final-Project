// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:intl/intl.dart';
import 'package:lounga/app/widgets/hotel_tile.dart';

import '../../../domain/entities/hotel.dart';
import '../../../domain/entities/user.dart';
import '../home/home_controller.dart';
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
  _HotelSearchViewState(super.controller);

  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context, HotelSearchController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
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
        onChanged: (val) => controller.controllerBookingDate.text = val;
        if (picked != null) {
          print(picked);
          selectedDate = picked;
          controller.changeDate(DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(selectedDate));
          //controller.controllerBookingDate.text = selectedDate.toString();
        }
  }


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
        body: ControlledWidgetBuilder<HotelSearchController>(
         builder: (BuildContext context, HotelSearchController controller) =>
        Stack(
          children: [
            ListView(
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
                              DropdownButtonFormField(
                                value: controller.city,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(controller.dropdownvalue[0]),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(controller.dropdownvalue[1]),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(controller.dropdownvalue[2]),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(controller.dropdownvalue[3]),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(controller.dropdownvalue[4]),
                                    value: 4,
                                  ),
                                ],
                                onChanged: (int? value) {
                                  controller.onChangedDropdownCity(value!);
                                },
                                hint: Text("City")),
                              const SizedBox(height: 20),
                              const Text('Booking Date',
                                style:
                                    TextStyle(
                                        color: Color(0XFFE67E22),
                                        fontWeight: FontWeight.w700,
                                      fontSize: 18)),
                              // Container(
                              //   width: MediaQuery.of(context).size.width * 0.85,
                              //   child: 
                              //   DateTimePicker(
                              //     type: DateTimePickerType.date,
                              //     dateMask: 'd MMM, yyyy',
                              //     initialValue: DateTime.now().toString(),
                              //     firstDate: DateTime.now(),
                              //     lastDate: DateTime(2100),
                              //     decoration: InputDecoration(
                              //       prefixIcon: Icon(Icons.calendar_month),
                              //       prefixIconConstraints: BoxConstraints(maxWidth: 60),),
                              //     cursorColor: Colors.pink,
                              //     onChanged: (val) =>
                              //         controller.controllerBookingDate.text = val,
                              //     validator: (val) {
                              //       controller.controllerBookingDate.text = val!;
                              //       return null;
                              //     },
                              //     onSaved: (val) =>
                              //         controller.controllerBookingDate.text = val!,
                              //   ),
                              // ),
                              SizedBox(height: 9),
                              Container(
                                padding: EdgeInsets.only(bottom: 7),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    GestureDetector(
                                      onTap: () {
                                         _selectDate(context, controller);
                                      },
                                      child: Icon(Icons.calendar_month, size: 25,)
                                    ),
                                    SizedBox(width: 5),
                                    Text("${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(
                                      // fontWeight: FontWeight.w900,
                                      // fontSize: 20,
                                    ),),
                                    Spacer()
                                  ],
                                ),
                              ),

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
                                  controller.dropdownvalue[controller.city], 
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
            controller.isLoading ? 
              Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2)
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color(0XFFE67E22),
                ),))
              : const SizedBox(),
          ],
        ),
        ),
        bottomNavigationBar: 
          ControlledWidgetBuilder<HotelSearchController>(
          builder: (BuildContext _, HotelSearchController controller) =>
            BottomNavigationBar(items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: controller.bottomNavigationValue == 0 ?
              const Icon(Icons.home)
              : const Icon(Icons.home_outlined),
            label: 'Home',
            ),
            BottomNavigationBarItem(icon: controller.bottomNavigationValue == 1 ?
              const Icon(Icons.receipt_long)
              : const Icon(Icons.receipt_long_outlined),
            label: 'My Order',
            ),
            BottomNavigationBarItem(icon: controller.bottomNavigationValue == 2 ?
              const Icon(Icons.person)
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
          onTap: (index) {
            // controller.bottomNavigationMove(index, widget.user.token);
            }
          )
          
        ),
      );
}
