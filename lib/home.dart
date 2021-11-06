import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
        title: Text(
          "Zido",
          style: TextStyle(fontFamily: "HelveticalNeuel", fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: () {},
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
              label: "Home",
              icon: Icon(
                Icons.home,
                color: mainColor,
              )),
          BottomNavigationBarItem(
              label: "Buy",
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black)),
          BottomNavigationBarItem(
              label: "Sell",
              icon: Icon(Icons.add_circle_outline, color: Colors.black)),
          BottomNavigationBarItem(
              label: "Account",
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
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: 1000,
                          child: Image.network(
                            'https://picsum.photos/seed/picsum/200/300',
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
              MainTitle(title: "Latest item"),
              Text(
                "See All",
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
                return LatestItemCard();
              },
            ),
          ),
          MainTitle(title: "Private Auctions"),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return PrivateAuctionCard();
              },
            ),
          ),
          MainTitle(title: "Latest Posts"),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return AdCard(img: 'https://picsum.photos/seed/picsum/200/300');
              },
            ),
          ),
        ],
      ),
    );
  }
}
