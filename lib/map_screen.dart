import 'package:flutter/material.dart';
import 'package:good_share/detail_screen.dart';
import 'package:good_share/map.dart';
import 'package:good_share/map_screen_bloc.dart';
import 'package:good_share/models.dart';
import 'package:good_share/rectangle_rounded_image.dart';
import 'package:rxdart/subjects.dart';

import 'fixtures/locations.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapScreenBloc = new MapScreenBloc();

  @override
  void dispose() {
    mapScreenBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMapView(mapScreenBloc: mapScreenBloc),
        DataContainer(mapScreenBloc: mapScreenBloc),
      ],
    );
  }
}

class DataContainer extends StatefulWidget {
  DataContainer({Key key, this.mapScreenBloc}) : super(key: key);

  final MapScreenBloc mapScreenBloc;

  @override
  _DataContainerState createState() => _DataContainerState();
}

class _DataContainerState extends State<DataContainer> {
  @override
  Widget build(BuildContext context) {
    final c = ScrollController();

    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
          height: 150.0,
          child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                // print('scroll notfication ${scrollNotification}');
                // if (scrollNotification is ScrollStartNotification) {
                //   print('scroll start ${scrollNotification}');
                // } else if (scrollNotification is ScrollUpdateNotification) {
                //   print('scroll update ${scrollNotification}');
                // } else
                if (scrollNotification is ScrollEndNotification) {
                  final cardWidth = MediaQuery.of(context).size.width * 0.8;
                  final n =
                      (scrollNotification.metrics.extentBefore / cardWidth)
                          .round();
                  widget.mapScreenBloc.locationInFocus.add(n);

                  print(
                      'End scroll ${scrollNotification.metrics} ${scrollNotification.metrics.extentBefore} ${n}');
                }
              },
              child: StreamBuilder(
                  stream: widget.mapScreenBloc.locations,
                  builder: (context, snapshot) {
                    final List<LocationModel> locations = snapshot.data ?? [];
                    return ListView(
                        scrollDirection: Axis.horizontal,
                        // controller: c,
                        physics: NoFlingScrollPhysics(),
                        children:
                            locations.map((item) => _dataItem(item)).toList());
                  }))),
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

class NoFlingScrollPhysics extends ScrollPhysics {
  @override
  double get maxFlingVelocity {
    print('maxFlingVelocity');
    return 0.001;
  }

  @override
  double get minFlingVelocity => 99999.0;

  // @override
  // double get minFlingDistance => 99999.0;

}
