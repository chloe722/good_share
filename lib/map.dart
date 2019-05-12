import 'dart:async';

import 'package:flutter/material.dart';
import 'package:good_share/fixtures/locations.dart';
import 'package:good_share/map_screen_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

import 'models.dart';

class GoogleMapView extends StatefulWidget {
  GoogleMapView({Key key, this.mapScreenBloc}) : super(key: key);

  final MapScreenBloc mapScreenBloc;

  @override
  _GoogleMapViewState createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  Completer<GoogleMapController> _controller = Completer();

  StreamSubscription locationInFocusSub;

  @override
  void initState() {
    super.initState();
    subscribe();
  }

  @override
  void didUpdateWidget(GoogleMapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    subscribe();
  }

  subscribe() {
    if (locationInFocusSub != null) {
      locationInFocusSub.cancel();
    }
    // subs.add(widget.mapScreenBloc.locations.listen((locations) {}));

    locationInFocusSub =
        widget.mapScreenBloc.locationInFocus.listen((locationInFocus) async {
      final controller = await _controller.future;
      final currentLocation =
          widget.mapScreenBloc.locations.value[locationInFocus];

      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLocation.geolocation, zoom: 14)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
            stream: CombineLatestStream.combine2(widget.mapScreenBloc.locations,
                widget.mapScreenBloc.locationInFocus, (a, b) => [a, b]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<LocationModel> locations = snapshot.data[0];
                final int locationInFocus = snapshot.data[1];
                final currentLocation = locations.length > locationInFocus
                    ? locations[locationInFocus]
                    : null;
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: currentLocation.geolocation ??
                          LatLng(25.032657, 121.533047),
                      zoom: 14),
                  onMapCreated: onMapCreate,
                  markers: Set.from(locations.map((location) =>
                      locationAsMarker(location, location == currentLocation))),
                  myLocationEnabled: true,
                );
              } else {
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(25.032657, 121.533047), zoom: 14),
                  onMapCreated: onMapCreate,
                  myLocationEnabled: true,
                );
              }
            }));
  }

  onMapCreate(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
  }

  locationAsMarker(LocationModel location, bool isInFocus) {
    return Marker(
        markerId: MarkerId(location.name),
        position: location.geolocation,
        infoWindow: InfoWindow(title: location.name),
        onTap: () {},
        icon: BitmapDescriptor.defaultMarkerWithHue(
            isInFocus ? BitmapDescriptor.hueRed : BitmapDescriptor.hueOrange));
  }

//
//  Marker restaurantMarker8= Marker(
//      markerId: MarkerId('restaurant8'),
//      position: LatLng(25.034189, 121.535979),
//      infoWindow: InfoWindow(title: 'Family Mart'),
//      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
//  );
//  /// Defined custom marker
//  Marker restaurantMarker9= Marker(
//      markerId: MarkerId('restaurant9'),
//      position: LatLng(25.0330, 121.5654),
//      infoWindow: InfoWindow(title: ''),
//      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
//  );
//
//  Marker restaurantMarker10= Marker(
//      markerId: MarkerId('restaurant10'),
//      position: LatLng(25.034189, 121.535979),
//      infoWindow: InfoWindow(title: 'Family Mart'),
//      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
//  );
//  /// Defined custom marker
//  Marker restaurantMarker11= Marker(
//      markerId: MarkerId('restaurant11'),
//      position: LatLng(25.0330, 121.5654),
//      infoWindow: InfoWindow(title: ''),
//      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
//  );
//
//  Marker restaurantMarker12= Marker(
//      markerId: MarkerId('restaurant12'),
//      position: LatLng(25.034189, 121.535979),
//      infoWindow: InfoWindow(title: 'Family Mart'),
//      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
//  );
}
