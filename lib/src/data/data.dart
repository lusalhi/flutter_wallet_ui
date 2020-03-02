// import 'package:flutter/material.dart';
// import 'package:flutter_wallet_ui_challenge/src/models/transaction_model.dart';

// List<TransactionModel> getPaymentsCard() {
//   List<TransactionModel> paymentCards = [
//     TransactionModel(Icons.receipt, Color(0xFFffd60f), "Florenti Restaurant",
//         "07-23", "20.04", 251.00, -1),
//     TransactionModel(Icons.monetization_on, Color(0xFFff415f), "Transfer To Anna",
//         "07-23", "14.01", 64.00, -1),
//     TransactionModel(Icons.location_city, Color(0xFF50f3e2), "Loan To Sanchez",
//         "07-23", "10.04", 1151.00, -1),
//     TransactionModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
//         "09.04", 37.00, -1),
//   ];

//   return paymentCards;
// }

// List<CategoryModel> getCategoryModel() {
//   List<CategoryModel> categoryModel = [
//     CategoryModel(1, Icons.receipt, Color(0xFFffd60f)),
//     CategoryModel(2, Icons.monetization_on, Color(0xFFff415f)),
//     CategoryModel(3, Icons.location_city, Color(0xFF50f3e2)),
//     CategoryModel(4, Icons.train, Colors.green),
//   ];
// }

// PaymentModel(Icons.receipt, Color(0xFFffd60f), "Florenti Restaurant",
//     "07-23", "20.04", 251.00, -1),
// PaymentModel(Icons.monetization_on, Color(0xFFff415f), "Transfer To Anna",
//     "07-23", "14.01", 64.00, -1),
// PaymentModel(Icons.location_city, Color(0xFF50f3e2), "Loan To Sanchez",
//     "07-23", "10.04", 1151.00, -1),
// PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
//     "09.04", 37.00, -1),

import 'package:flutter/material.dart';
import 'package:flutter_wallet_ui_challenge/src/models/transaction_model.dart';
import 'package:flutter_wallet_ui_challenge/src/widgets/donut_charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

List<TransactionModel>
    transactions = [];

var data = [
  new DataPerItem('Home', 35, Colors.greenAccent),
  new DataPerItem('Food & Drink', 25, Colors.yellow),
  new DataPerItem('Hotel & Restaurant', 24, Colors.indigo),
  new DataPerItem('Travelling', 40, Colors.pinkAccent),
];

var series = [
  new charts.Series(
    domainFn: (DataPerItem clickData, _) => clickData.name,
    measureFn: (DataPerItem clickData, _) => clickData.percent,
    colorFn: (DataPerItem clickData, _) => clickData.color,
    id: 'Item',
    data: data,
  ),
];
