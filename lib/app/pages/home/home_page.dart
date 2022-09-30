import 'package:lounga/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

import '../../../domain/entities/user.dart';

class HomePage extends View {
  static const route = '/home-page';

  final User user;

  const HomePage(this.user, {Key? key}) : super(key: key);
  
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final homeController = Injector.appInstance.get<HomeController>();
    return _HomeViewState(homeController);
  }
}

class _HomeViewState extends ViewState<HomePage, HomeController> {
  _HomeViewState(super.controller);

  @override
  Widget get view => Scaffold(
    key: globalKey,
    appBar: AppBar(
      backgroundColor: const Color(0XFFE67E22),
      title: const Text('LOUNGA'),
    ),
    backgroundColor: const Color(0XFFD3D3D3),
    body: ControlledWidgetBuilder<HomeController>(
      builder: (BuildContext _, HomeController controller) =>
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ElevatedButton (
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  backgroundColor: Colors.white
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.airplanemode_active, size: 150, color: Color(0XFFE67E22),),
                    Text("FLIGHT", style: TextStyle(fontSize: 40, color: Color(0XFFE67E22)),)
                  ],
                )
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ElevatedButton (
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  backgroundColor: Colors.white
                ),
                child: Column(
                  children: const [
                    Icon(Icons.hotel, size: 150, color: Color(0XFFE67E22),),
                    Text("HOTEL", style: TextStyle(fontSize: 40, color: Color(0XFFE67E22),),)
                  ],
                )
              )
            ),
        ]),
      ),
    bottomNavigationBar: 
      ControlledWidgetBuilder<HomeController>(
      builder: (BuildContext _, HomeController controller) =>
        BottomNavigationBar(items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: controller.bottomNavigationValue == 0 ?
          Icon(Icons.home)
          : Icon(Icons.home_outlined),
        label: 'Home',
        ),
        BottomNavigationBarItem(icon: controller.bottomNavigationValue == 1 ?
          Icon(Icons.receipt_long)
          : Icon(Icons.receipt_long_outlined),
        label: 'My Order',
        ),
        BottomNavigationBarItem(icon: controller.bottomNavigationValue == 2 ?
          Icon(Icons.person)
          : Icon(Icons.person_outline),
        label: 'My Account',
        ),
        ],
      currentIndex: controller.bottomNavigationValue,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0XFFE67E22),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (index) => controller.bottomNavigationMove(index)
      ),      
    ),
        // controller.isLoading
        // ? const Center(child: CupertinoActivityIndicator())
        // : ListView.builder(
        //   //shrinkWrap: true,
        //   itemCount: controller.hotels.length,            
        //   itemBuilder: (BuildContext _, int index) {
        //     final hotel = controller.hotels[index];
        //     final room = hotel.roomsHotel.first.price.toString();
        //     // return Text(rooms);
        //     return HotelTile(
        //       hotel: hotel,
        //       onHotelClicked: (Hotel hotel) {
        //         controller.navigateToHotelDetail(hotel);
        //       },
        //       );
        //   }
        // )
        
  );
}