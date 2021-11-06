import 'package:flutter/material.dart';
import 'package:zidotask/home.dart';
import 'package:zidotask/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zido Hiring task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: mainColor,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Montserrat',
            ),
      ),
      home: HomePage(),
    );
  }
}
