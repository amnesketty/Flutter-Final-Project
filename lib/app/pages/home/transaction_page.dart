import 'package:flutter/material.dart';
import 'package:lounga/domain/entities/user_transaction.dart';

class TransactionPage extends StatelessWidget {
  final UserTransaction userTransaction;
  const TransactionPage(this.userTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              "Hotel History Transaction",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.375,
            child: userTransaction.bookingHotels.isEmpty
                ? const Center(
                    child: Text('Data Not Found'),
                  )
                : ListView.builder(
                    itemCount: userTransaction.bookingHotels.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0XFFFFFFFF),
                        ),
                        child: Container(
                          height: 100,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Booking ID ${userTransaction.bookingHotels[index].bookingHotelNo}',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Rp${userTransaction.bookingHotels[index].price * userTransaction.bookingHotels[index].totalRoom}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.airplanemode_active_rounded),
                                  Text(
                                    userTransaction
                                        .bookingFlights[index].destinationFrom,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 13,
                                  ),
                                  Text(
                                    'Purchase Successfull',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })),
        Row(
          children: const [
            Text(
              "Flight History Transaction",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.375,
            child: userTransaction.bookingFlights.isEmpty
                ? const Center(
                    child: Text('Data Not Found'),
                  )
                : ListView.builder(
                    itemCount: userTransaction.bookingFlights.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Booking ID ${userTransaction.bookingFlights[index].bookingFlightNo}',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'Rp${userTransaction.bookingFlights[index].totalPrice * userTransaction.bookingFlights[index].amountPassenger}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.airplanemode_active_rounded),
                                Text(
                                  userTransaction
                                      .bookingFlights[index].destinationFrom,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 13,
                                ),
                                Text(
                                  'Purchase Successfull',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    })),
      ],
    );
  }
}
