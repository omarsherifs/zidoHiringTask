import 'package:flutter/material.dart';
import 'package:zidotask/I10n/app_localizations.dart';
import 'package:zidotask/widgets/mainCard.dart';

class AdCard extends StatefulWidget {
  final String img;
  AdCard({this.img = ""});
  @override
  _AdCardState createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
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
                height: 200,
                width: MediaQuery.of(context).size.width * 0.9,
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.8],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img/holder.png',
                      ),
                      fit: BoxFit.cover,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context).translate('exampleText'),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/img/avatar.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .translate('userName'),
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(AppLocalizations.of(context).translate('exa'),
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
