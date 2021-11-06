import 'package:flutter/material.dart';

class MainCard extends StatefulWidget {
  final Widget cardContent;
  final double radius;
  final double elevation;
  MainCard(
      {required this.cardContent, this.radius = 5.0, this.elevation = 2.0});
  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        child: Material(
          elevation: widget.elevation,
          color: Color(int.parse("0xFFF1F4FD")),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          child: widget.cardContent,
        ),
      ),
    );
  }
}
