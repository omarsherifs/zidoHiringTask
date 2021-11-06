import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zidotask/I10n/app_localizations.dart';
import 'package:zidotask/utils.dart';
import 'package:zidotask/widgets/mainCard.dart';

class LatestItemCard extends StatefulWidget {
  final String img;
  LatestItemCard({this.img = ""});
  @override
  _LatestItemCardState createState() => _LatestItemCardState();
}

class _LatestItemCardState extends State<LatestItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          MainCard(
              elevation: 0.0,
              radius: 10.0,
              cardContent: Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                height: 500,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                widget.img,
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: mainColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(5.0)),
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: IconButton(
                              icon: Container(
                                decoration: BoxDecoration(
                                    color: Colors.cyan[50],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    )),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: Colors.cyan,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {}),
                        )
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)),
                      ),
                      child: Center(
                        child: Text(
                          "70:00:00",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text("\$100,000,00",
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                  AppLocalizations.of(context)
                                      .translate('exampleText'),
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ))),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.21,
                                height:
                                    MediaQuery.of(context).size.width * 0.08,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: mainColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "Hafr Elbatin",
                                    style: TextStyle(
                                        color: mainColor, fontSize: 12),
                                  ),
                                )),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.12,
                                height:
                                    MediaQuery.of(context).size.width * 0.08,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.cyan,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "Used",
                                    style: TextStyle(
                                        color: Colors.cyan, fontSize: 12),
                                  ),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
