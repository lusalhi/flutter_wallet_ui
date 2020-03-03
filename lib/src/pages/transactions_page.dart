import 'package:flutter/material.dart';
import 'package:flutter_wallet_ui_challenge/src/data/data.dart';
import '../widgets/payment_card.dart';

class TransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Transactions",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            inherit: true,
            letterSpacing: 0.4,
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return PaymentCardWidget(
              transaction: transactions[index],
            );
          },
        ),
      ],
    );
  }
}
