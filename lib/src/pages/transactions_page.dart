import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../widgets/payment_card.dart';
import 'package:http/http.dart' as http;

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<TransactionModel> transactions = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: 20,
          top: 50,
        ),
        children: <Widget>[
          Text(
            "Transactions",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: fetchTransactions(),
            builder: (context, snapshot) {
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
              return Container(
                height: _media.height,
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return PaymentCardWidget(
                      transaction: transactions[index],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            addTransaction();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> addTransaction() async {
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    String day = DateTime.now().day.toString();
    var url = 'https://wallet-ee0b1.firebaseio.com/wallet/$year/$month.json';
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
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    var url = 'https://wallet-ee0b1.firebaseio.com/wallet/$year/$month.json';
    print(url);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      extractedData.forEach(
        (transId, transData) {
          transactions.add(
            TransactionModel(
              transId.toString(),
              int.parse(transData['iconId']),
              transData['name'].toString(),
              transData['date'].toString(),
              transData['hour'].toString(),
              double.parse(transData['amount']),
              int.parse(transData['paymentType']),
            ),
          );
        },
      );
    } catch (error) {
      throw (error);
    }
  }
}
