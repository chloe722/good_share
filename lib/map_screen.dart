import 'package:flutter/material.dart';
import 'package:good_share/detail_screen.dart';
import 'package:good_share/map.dart';
import 'package:good_share/models.dart';
import 'package:good_share/rectangle_rounded_image.dart';

import 'fixtures/locations.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMapView(),
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
            children: locationFixtures.map((item) => _dataItem(item)).toList()),
      ),
    );
  }

  Widget _dataItem(LocationModel location) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailScreen(location: location)));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 300.0,
        child: LocationCard(location: location),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  LocationCard({Key key, this.location}) : super(key: key);

  LocationModel location;
  @override
  Widget build(BuildContext context) {
    final item = location.items.first;

    return Card(
      margin: EdgeInsets.only(left: 10.0, right: 20.0),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
              tag: location.name,
              child: RectangleRoundedImage(image: location.logo)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(location.name, style: TextStyle(fontSize: 18.0))),
              Text(item.expiryTime),
              Text(' ${item.remaining} left !',
                  style: TextStyle(color: Colors.red[300]))
            ],
          )
        ],
      ),
    );
  }
}
