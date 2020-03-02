import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallet_ui_challenge/src/data/data.dart';
import 'package:flutter_wallet_ui_challenge/src/models/transaction_model.dart';
import 'package:flutter_wallet_ui_challenge/src/pages/transactions_page.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_wallet_ui_challenge/src/widgets/cash_flow.dart';
import 'package:flutter_wallet_ui_challenge/src/widgets/budgets_bar.dart';
import 'package:flutter_wallet_ui_challenge/src/widgets/spending_chart.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchTransactions(),
        builder: (context, snapshot) {
          {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text(
                  'Not Found',
                  textAlign: TextAlign.center,
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error');
                }
            }
            return ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: 20,
                top: 50,
              ),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Overview",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'July 2018',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                CashFlow(),
                SizedBox(
                  height: 30,
                ),
                SpendingChart(),
                SizedBox(
                  height: 30,
                ),
                BudgetsBar(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    inherit: true,
                    letterSpacing: 0.4,
                  ),
                ),
                TransactionsPage()
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }

  Future<void> addTransaction() async {
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    String day = DateTime.now().day.toString();
    var url = 'https://wallet-ee0b1.firebaseio.com/wallet.json';
    print(url);
    http.post(
      url,
      body: json.encode(
        {
          'name': 'pop corn',
          'amount': '15000',
          'date': day,
          'hour': '14.50',
          'paymentType': '-1',
          'iconId': '123',
        },
      ),
    );
  }

  Future<void> fetchTransactions() async {
    print('a');
    transactions.clear();
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    var url = 'https://wallet-ee0b1.firebaseio.com/wallet.json';
    print(url);
    try {
      final response = await http.get(url);
      print(response.body);
      final extractedData = json.decode(response.body)
          as YearTransactionModel<MonthTransactionModel<TransactionModel>>;
      print(extractedData);
      // forEach(
      //   (transData) {
      //     transactions.add(
      //       TransactionModel(
      //         transData,
      //         int.parse(transData['iconId']),
      //         transData['name'].toString(),
      //         transData['date'].toString(),
      //         transData['hour'].toString(),
      //         double.parse(transData['amount']),
      //         int.parse(transData['paymentType']),
      //       ),
      //     );
      //   },
      // );
    } catch (error) {
      throw (error);
    }
  }
}
