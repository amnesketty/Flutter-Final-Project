import 'package:lounga/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';
import 'package:lounga/app/pages/home/profile_page.dart';
import 'package:lounga/app/pages/home/transaction_page.dart';
import 'package:lounga/app/pages/login/login_controller.dart';
import 'package:lounga/app/pages/register/register_controller.dart';

import '../../../domain/entities/user.dart';
import 'home_page_main.dart';

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
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0XFFE67E22),
          flexibleSpace: SafeArea(
              child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text('LOUNGA'),
              Spacer(),
              ControlledWidgetBuilder<RegisterController>(
                  builder: (BuildContext _, RegisterController controller) =>
                      IconButton(
                          onPressed: () {
                            controller.navigateToLoginPage();
                          },
                          icon: Icon(Icons.logout)))
            ],
          )),
          /*actions: [
            ControlledWidgetBuilder<RegisterController>(
                builder: (BuildContext _, RegisterController controller) =>
                    IconButton(
                        onPressed: () {
                          controller.navigateToLoginPage();
                        },
                        icon: Icon(Icons.logout)))
          ],*/
        ),
        backgroundColor: const Color(0XFFD3D3D3),
        body: ControlledWidgetBuilder<HomeController>(
            builder: (BuildContext _, HomeController controller) =>
                controller.bottomNavigationValue == 0
                    ? Column(children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: Colors.white),
                                onPressed: () {
                                  controller
                                      .navigateToSearchFlight(widget.user);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //Transform.rotate(angle: 90, child: Text("test"),)
                                    Transform.rotate(
                                        angle: 1.57,
                                        child: Icon(
                                          Icons.airplanemode_active,
                                          size: 150,
                                          color: Color(0XFFE67E22),
                                        )),
                                    Text(
                                      "FLIGHT",
                                      style: TextStyle(
                                          fontSize: 40,
                                          color: Color(0XFFE67E22)),
                                    )
                                  ],
                                ))),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ElevatedButton(
                                onPressed: () {
                                  controller.navigateToSearchHotel(widget.user);
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: Colors.white),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.hotel,
                                      size: 150,
                                      color: Color(0XFFE67E22),
                                    ),
                                    Text(
                                      "HOTEL",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Color(0XFFE67E22),
                                      ),
                                    )
                                  ],
                                ))),
                      ])
                    : controller.bottomNavigationValue == 1
                        ? TransactionPage(
                            controller.userTransaction!,
                            controller.dropDownValueTransaction,
                            controller.refreshUserTransaction)
                        : ProfilePage(widget.user)),
        bottomNavigationBar: ControlledWidgetBuilder<HomeController>(
          builder: (BuildContext _, HomeController controller) =>
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
                  onTap: (index) {
                    controller.bottomNavigationMove(index, widget.user.token);
                  }),
        ),
      );
}
