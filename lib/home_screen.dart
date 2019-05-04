import 'package:flutter/material.dart';
import 'package:good_share/constants.dart';
import 'package:good_share/detail_screen.dart';
import 'package:good_share/map_screen.dart';
import 'package:good_share/profile_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapScreen(),
    ProfileScreen(),
  ];

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.green[500],
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Map')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
            title: Text('Profile')

        ),

      ]),
      body: _children[_currentIndex],
    );
  }
}


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Map(),
        DataContainer(),
      ],
    );
  }
}


class DataContainer extends StatefulWidget {
  @override
  _DataContainerState createState() => _DataContainerState();
}

class _DataContainerState extends State<DataContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _dataItem(store: Constants.carreFour, item: 'Fish',countDown: '10 : 00 : 20', remainsNumber: '10', image: 'image/carrefour.png'),
            _dataItem(store: Constants.familyMart, item: 'Riceball',countDown: '11 : 00 : 20', remainsNumber: '5', image: 'image/family_mart.png'),
            _dataItem(store: Constants.misterDonut, item: 'Chocolate Donut',countDown: '10 : 00 : 20', remainsNumber: '2', image: 'image/mister_donut.png'),
            _dataItem(store: Constants.springVagie, item: 'Vagie Bento',countDown: '10 : 00 : 20', remainsNumber: '8', image: 'image/spring_vagetarian.jpeg'),
            _dataItem(store: Constants.summeryCafe, item: 'Croissant',countDown: '10 : 00 : 20', remainsNumber: '7', image: 'image/sunmerry.jpeg'),
            _dataItem(store: Constants.wooBento, item: 'Fish bento',countDown: '10 : 00 : 20', remainsNumber: '4', image: 'image/woo_bento.jpeg'),

          ],
        ),
      ),
    );
  }


  Widget _dataItem({String store, String item,  String countDown, String remainsNumber, String image}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailScreen(store: store,
                  logo: image,
                  remainNumber: remainsNumber,
                  countDown: countDown)));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 300.0,
        child: Card(
          margin: EdgeInsets.only(left: 10.0, right: 20.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 80.0,
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),child: Text(store, style: TextStyle(fontSize: 18.0))),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),child: Text(item)),
                  Text(countDown),
                  Text(' $remainsNumber left !', style: TextStyle(color: Colors.red[300]))
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}

