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
            Text("Hotel History Transaction", style: TextStyle(fontSize: 20),),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.375,
          child: 
            userTransaction.bookingHotels.isEmpty
            ? const Center(child: Text('Data Not Found'),)
            : ListView.builder(
              itemCount: userTransaction.bookingHotels.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  width: 200,
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFFFFFFFF),),
                  child: Text(userTransaction.bookingHotels[index].bookingHotelNo),
              );
            }
          )
        ),
        Row(
          children: const [
            Text("Flight History Transaction", style: TextStyle(fontSize: 20),),
          ],
        ),
        Container(          
          height: MediaQuery.of(context).size.height * 0.375,
          child: 
            userTransaction.bookingFlights.isEmpty
            ? const Center(child: Text('Data Not Found'),)
            : ListView.builder(
              itemCount: userTransaction.bookingFlights.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  width: 200,
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFFFFFFFF),),
                  child: Text(userTransaction.bookingFlights[index].bookingFlightNo),
              );
            }
          )
        ),
      ],
    );
  }
}