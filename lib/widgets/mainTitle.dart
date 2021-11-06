import 'package:flutter/material.dart';
import 'package:zidotask/utils.dart';

class MainTitle extends StatefulWidget {
  final String title;
  MainTitle({this.title});
  @override
  _MainTitleState createState() => _MainTitleState();
}

class _MainTitleState extends State<MainTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "${widget.title}",
            style: header1,
          )
        ],
      ),
    );
  }
}
