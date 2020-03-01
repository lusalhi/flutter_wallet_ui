import 'package:flutter/material.dart';
import 'pages/transactions_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Varela",
      ),
      home: TransactionsPage(),
    );
  }
}
