import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zidotask/I10n/app_localizations.dart';
import 'package:zidotask/utils.dart';
import 'package:zidotask/widgets/mainCard.dart';

class PrivateAuctionCard extends StatefulWidget {
  final String img;
  PrivateAuctionCard({this.img = ""});
  @override
  _PrivateAuctionCardState createState() => _PrivateAuctionCardState();
}

class _PrivateAuctionCardState extends State<PrivateAuctionCard> {
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
                height: 150,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.cover,
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
                              child: Text(
                                  AppLocalizations.of(context)
                                      .translate('exampleText'),
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 9,
                                backgroundImage:
                                    AssetImage("assets/img/avatar.png"),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *0.4,
                                    child: Text(
                                        AppLocalizations.of(context)
                                            .translate('exampleText'),
                                            softWrap: true,
                                        style: TextStyle(fontSize: 13,)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.clock,
                                    color: Colors.cyan,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "10:00:00",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.cyan),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Container(
                                width: 75,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  AppLocalizations.of(context)
                                      .translate('used'),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
