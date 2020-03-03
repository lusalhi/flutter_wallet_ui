import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/transaction_model.dart';
import '../pages/transactions_page.dart';
import '../widgets/floating_action_button.dart';
import '../widgets/cash_flow.dart';
import '../widgets/budgets_bar.dart';
import '../widgets/spending_chart.dart';

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
                  return Center(child: Text(snapshot.error.toString()));
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
                SizedBox(height: 25),
                CashFlow(),
                SizedBox(height: 30),
                SpendingChart(),
                SizedBox(height: 30),
                BudgetsBar(),
                SizedBox(height: 30),
                TransactionsPage()
              ],
            );
          }
        },
      ),
      floatingActionButton: MyFAB(),
    );
  }

  Future<void> addTransaction() async {
    var post = TransactionModel(
        name: 'bala gehu',
        date: 03,
        paymentType: -1,
        hour: '14.40',
        iconId: 1321,
        amount: 5000,
        yearmonth: 202003);
    // String year = DateTime.now().year.toString();
    // String month = DateTime.now().month.toString();
    // String day = DateTime.now().day.toString();
    var url = 'https://wallet-ee0b1.firebaseio.com/wallet.json';
    print(url);
    http.post(
      url,
      body: json.encode({
        'name': post.name,
        'date': post.date,
        'paymentType': post.paymentType,
        'hour': post.hour,
        'iconId': post.iconId,
        'amount': post.amount,
        'yearMonth': post.yearmonth
      }),
    );
  }

  Future<void> fetchTransactions() async {
    print('a');
    transactions.clear();
    // String year = DateTime.now().year.toString();
    // String month = DateTime.now().month.toString();
    var url = 'https://wallet-ee0b1.firebaseio.com/wallet.json';
    print(url);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      extractedData.forEach(
        (transId, transData) {
          transactions.add(
            TransactionModel(
              id: transId,
              amount: transData['amount'],
              iconId: transData['iconId'],
              hour: transData['hour'],
              paymentType: (transData['paymentType']),
              date: transData['date'],
              name: transData['name'],
            ),
          );
        },
      );
    } catch (error) {
      throw (error);
    }
  }
}
