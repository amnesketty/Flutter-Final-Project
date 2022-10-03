import 'package:flutter/material.dart';
import 'package:lounga/domain/entities/user_transaction.dart';

class TransactionPage extends StatelessWidget {
  final UserTransaction? userTransaction;

  const TransactionPage(this.userTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(userTransaction!.username),
        ],
      ),
    );
  }
}