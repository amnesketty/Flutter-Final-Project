import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lounga/domain/entities/user_transaction.dart';

class TransactionPage extends StatelessWidget {
  final UserTransaction userTransaction;
  final int dropDownValueTransaction;
  final VoidCallback refreshTransaction;
  const TransactionPage(this.userTransaction, this.dropDownValueTransaction, this.refreshTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField(
            value: dropDownValueTransaction,
            items: const [
              DropdownMenuItem(
                value: 1,
                child: Text("Hotel Transaction")
                ),
              DropdownMenuItem(
                value: 2,
                child: Text("Flight Transaction"))
            ],
            onChanged: //refreshTransaction(value),
            (int? value) {
              if(value != dropDownValueTransaction)
              {
                refreshTransaction();
              }
            }
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: dropDownValueTransaction == 1 ?
            userTransaction.bookingHotels.isEmpty
              ? const Center(
                child: Text('Data Not Found'),)
                : ListView.builder(
                  itemCount: userTransaction.bookingHotels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
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
                            const SizedBox(
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
                                const Spacer(),
                                Text(
                                  'Rp${userTransaction.bookingHotels[index].price}',
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.hotel),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(userTransaction.bookingHotels[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 13,
                                ),
                                const Text(
                                  'Purchase Successfull',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(DateFormat.yMMMEd().format(
                                  DateTime.parse(userTransaction.bookingHotels[index].bookingDate)),
                                  style: const TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }) 
            : userTransaction.bookingFlights.isEmpty
              ? const Center(
                child: Text('Data Not Found'),)
                : ListView.builder(
                  itemCount: userTransaction.bookingFlights.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0XFFFFFFFF),
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            const SizedBox(
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
                                const Spacer(),
                                Text(
                                  'Rp${userTransaction.bookingFlights[index].totalPrice}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Transform.rotate(
                                  angle: 1.57,
                                  child: const Icon(Icons.airplanemode_active)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(userTransaction.bookingFlights[index].destinationFrom,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(Icons.arrow_right_alt),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(userTransaction.bookingFlights[index].destinationFrom,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 13,
                                ),
                                const Text(
                                  'Purchase Successfull',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(DateFormat.yMMMEd().format(
                                  DateTime.parse(userTransaction.bookingFlights[index].bookingDate)),
                                  style: const TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }) 
                  ),
      ],
    );
  }
}
