import 'dart:async';

import 'package:flutter/material.dart';
import 'package:good_share/fixtures/locations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models.dart';

class GoogleMapView extends StatefulWidget {
  @override
  _GoogleMapViewState createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(25.032657, 121.533047), zoom: 14),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: getMarkers(),
        myLocationEnabled: true,
      ),
    );
  }

  Set<Marker> getMarkers() {
    return Set.from(locationFixtures.map(locationAsMarker));
  }

  locationAsMarker(LocationModel location) {
    return Marker(
        markerId: MarkerId(location.name),
        position: location.geolocation,
        infoWindow: InfoWindow(title: location.name),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange));
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
