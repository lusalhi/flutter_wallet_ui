import 'package:flutter/material.dart';

class MyFAB extends StatefulWidget {
  const MyFAB({
    Key key,
  }) : super(key: key);

  @override
  _MyFABState createState() => _MyFABState();
}

class _MyFABState extends State<MyFAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
            ),
          ),
        );
      },
    );
  }
}
