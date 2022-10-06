import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/hotel.dart';
import '../../../domain/entities/user.dart';
import '../../widgets/pop_up_dialog.dart';
import '../../widgets/text_field.dart';
import 'hotel_booking_controller.dart';

class HotelBookingPage extends View {
  static const route = '/hotel-booking';

  final Hotel hotel;
  final User user;
  final String bookingDate;
  final int totalRoom;
  final RoomsHotel roomsHotel;

  const HotelBookingPage(
      this.hotel, this.user, this.bookingDate, this.totalRoom, this.roomsHotel,
      {Key? key})
      : super(key: key);

  @override
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
          title: const Text('FILL IN DETAILS'),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
        body: ControlledWidgetBuilder<HotelBookingController>(
          builder: (BuildContext context, HotelBookingController controller) =>
              Stack(
            children: [
              SingleChildScrollView(
                  child: Column(children: [
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: const Color(0XFFE67E22),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const SizedBox(height: 15),
                              const Text('Your Booking Summary',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900)),
                              const SizedBox(height: 5),
                              Row(children: [
                                const Icon(Icons
                                    .airline_seat_individual_suite_rounded),
                                const SizedBox(width: 5),
                                Text(widget.hotel.name,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900)),
                              ]),
                              const SizedBox(height: 5),
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                const Text('Check-in',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                                const Spacer(),
                                Text(
                                    DateFormat.yMMMEd().format(
                                        DateTime.parse(widget.bookingDate)),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900))
                              ]),
                              const SizedBox(height: 5),
                              Row(children: [
                                const Text('Check-out',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                                const Spacer(),
                                Text(
                                    DateFormat.yMMMEd().format(
                                        DateTime.parse(widget.bookingDate)
                                            .add(const Duration(days: 1))),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900))
                              ]),
                              const SizedBox(height: 5),
                              Row(children: [
                                Text('${widget.totalRoom}x',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02),
                                Text(widget.roomsHotel.type,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900))
                              ]),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                    'Rp ${widget.roomsHotel.price * widget.totalRoom}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                              )
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.04),
                      ],
                    )),
                Container(
                    margin:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.62,
                    color: Colors.white,
                    child: Column(
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
                        TextFieldCustome(
                            textEditingController:
                                controller.controllerContactName,
                            textLabel: "Contact's Name"),
                        const SizedBox(height: 10),
                        const Text("Email",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            )),
                        const SizedBox(height: 7),
                        TextFieldCustome(
                            textEditingController: controller.controllerEmail,
                            textLabel: "Email"),
                        const SizedBox(height: 10),
                        const Text("Phone",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            )),
                        const SizedBox(height: 7),
                        TextFieldCustome(
                            textEditingController: controller.controllerPhone,
                            textLabel: "Phone"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child:
                                ControlledWidgetBuilder<HotelBookingController>(
                              builder: (BuildContext context,
                                      HotelBookingController controller) =>
                                  TextButton(
                                      onPressed: () async {
                                        controller.bookHotel(
                                            widget.hotel,
                                            widget.user,
                                            widget.bookingDate,
                                            widget.totalRoom,
                                            widget.roomsHotel.price *
                                                widget.totalRoom,
                                            widget.roomsHotel.id,
                                            controller
                                                .controllerContactName.text,
                                            controller.controllerEmail.text,
                                            controller.controllerPhone.text);
                                        do {
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                        } while (controller.isLoading);
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                PopUpDialog(
                                                    function: () {
                                                      controller
                                                          .navigateToHomePage(
                                                              widget.user);
                                                    },
                                                    message: "success",
                                                    tipePopUpDialog:
                                                        "bookingSuccess",
                                                    popUpButton:
                                                        "bookingSuccess"));
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0XFFE67E22)),
                                      child: const Text('BOOK HOTEL',
                                          style:
                                              TextStyle(color: Colors.white))),
                            ))
                      ],
                    ))
              ])),
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
      );
}
