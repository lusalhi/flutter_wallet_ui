import 'package:flutter/material.dart';
import 'package:flutter_wallet_ui_challenge/src/utils/screen_size.dart';
import 'package:flutter_wallet_ui_challenge/src/widgets/percent_indicator.dart';

class BudgetsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Budgets",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Varela",
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
            right: 20,
          ),
          padding: EdgeInsets.all(10),
          height: screenAwareSize(45, context),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 6,
                spreadRadius: 10,
              )
            ],
          ),
          child: LinearPercentIndicator(
            width: screenAwareSize(
                _media.width - (_media.longestSide <= 775 ? 100 : 160),
                context),
            lineHeight: 20.0,
            percent: 0.68,
            backgroundColor: Colors.grey.shade300,
            progressColor: Color(0xFF1b52ff),
            animation: true,
            animateFromLastPercent: true,
            alignment: MainAxisAlignment.spaceEvenly,
            animationDuration: 1000,
            linearStrokeCap: LinearStrokeCap.roundAll,
            center: Text(
              "68.0%",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
