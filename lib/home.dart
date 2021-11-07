import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zidotask/I10n/AppLanguage.dart';
import 'package:zidotask/I10n/app_localizations.dart';
import 'package:zidotask/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zidotask/widgets/adsWidget.dart';
import 'package:zidotask/widgets/latestItemCard.dart';
import 'package:zidotask/widgets/mainTitle.dart';
import 'package:zidotask/widgets/privateAuctionsCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sliderCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: mainColor,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.search),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Image.asset("assets/img/logo.png"),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: () {
              changeLangPopUp();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        fixedColor: mainColor,
        unselectedLabelStyle: TextStyle(color: mainColor),
        items: [
          BottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('home'),
              icon: Icon(
                Icons.home,
                color: mainColor,
              )),
          BottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('buy'),
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black)),
          BottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('sell'),
              icon: Icon(Icons.add_circle_outline, color: Colors.black)),
          BottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('account'),
              icon: Icon(Icons.person_outline, color: Colors.black))
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 150.0,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      sliderCurrentIndex = index;
                    });
                  },
                ),
                items: [1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: 1000,
                          child: Image.asset(
                            'assets/img/Slider$i.png',
                            fit: BoxFit.cover,
                          ));
                    },
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainTitle(
                title: AppLocalizations.of(context).translate('latestItem'),
              ),
              Text(
                AppLocalizations.of(context).translate('seeAll'),
                style: TextStyle(color: mainColor),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return LatestItemCard(
                  img: 'assets/img/product${index + 1}.png',
                );
              },
            ),
          ),
          MainTitle(
            title: AppLocalizations.of(context).translate('privateAuctions'),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return PrivateAuctionCard(
                  img: "assets/img/product${index + 1}.png",
                );
              },
            ),
          ),
          MainTitle(
            title: AppLocalizations.of(context).translate('latestPosts'),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return AdCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget changeLangPopUp() {
    var appLanguage = Provider.of<AppLanguage>(context);
    return CupertinoActionSheet(
      title: new Text('${AppLocalizations.of(context).translate('language')}'),
      message: new Text(
          '${AppLocalizations.of(context).translate('changeLanguage')}'),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: new Text('English'),
          onPressed: () {
            appLanguage.changeLanguage(Locale("en"));
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: new Text('عربى'),
          onPressed: () {
            appLanguage.changeLanguage(Locale("ar"));
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: new Text('رجوع'),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
      ),
    );
  }
}
