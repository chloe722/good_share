import 'package:flutter/material.dart';
import 'package:good_share/map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resecue the food'),
        backgroundColor: Colors.teal[300],
      ),

      body: Stack(
        children: <Widget>[
          MapScreen(),
          DataContainer(),
        ],
      ),
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
            _dataItem(store: 'CarreFour', item: 'Fish',countDown: '10 : 00 : 20', remainsNumber: '10', image: 'image/carrefour.png'),
            _dataItem(store: 'FamilyMart', item: 'Riceball',countDown: '11 : 00 : 20', remainsNumber: '5', image: 'image/family_mart.png'),
            _dataItem(store: 'Mister Donut', item: 'Chocolate Donut',countDown: '10 : 00 : 20', remainsNumber: '2', image: 'image/mister_donut.png'),
            _dataItem(store: 'Spring Vagie', item: 'Vagie Bento',countDown: '10 : 00 : 20', remainsNumber: '8', image: 'image/spring_vagetairan.jpeg'),
            _dataItem(store: 'Sunmerry Cafe', item: 'Croissant',countDown: '10 : 00 : 20', remainsNumber: '7', image: 'image/sunmerry.jpeg'),
            _dataItem(store: 'Woo Bento', item: 'Fish bento',countDown: '10 : 00 : 20', remainsNumber: '4', image: 'image/woo_bento.jpeg'),

          ],
        ),
      ),
    );
  }


  Widget _dataItem({String store, String item,  String countDown, String remainsNumber, String image}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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

    );
  }
}

