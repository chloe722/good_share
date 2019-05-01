import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target: LatLng(25.0330, 121.5654), zoom: 20),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {restaurantMarker, restaurantMarker2},
          ),
    );
  }


  /// Defined custom marker
  Marker restaurantMarker= Marker(
    markerId: MarkerId('restaurant'),
    position: LatLng(25.0330, 121.5654),
    infoWindow: InfoWindow(title: ''),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker2= Marker(
      markerId: MarkerId('restaurant2'),
      position: LatLng(25.034189, 121.535979),
      infoWindow: InfoWindow(title: 'Family Mart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  /// Defined custom marker
  Marker restaurantMarker3= Marker(
      markerId: MarkerId('restaurant3'),
      position: LatLng(25.0330, 121.5654),
      infoWindow: InfoWindow(title: ''),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker4= Marker(
      markerId: MarkerId('restaurant4'),
      position: LatLng(25.034189, 121.535979),
      infoWindow: InfoWindow(title: 'Family Mart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );
  /// Defined custom marker
  Marker restaurantMarker5= Marker(
      markerId: MarkerId('restaurant5'),
      position: LatLng(25.0330, 121.5654),
      infoWindow: InfoWindow(title: ''),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker6= Marker(
      markerId: MarkerId('restaurant6'),
      position: LatLng(25.034189, 121.535979),
      infoWindow: InfoWindow(title: 'Family Mart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );
  /// Defined custom marker
  Marker restaurantMarker7= Marker(
      markerId: MarkerId('restaurant7'),
      position: LatLng(25.0330, 121.5654),
      infoWindow: InfoWindow(title: ''),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker8= Marker(
      markerId: MarkerId('restaurant8'),
      position: LatLng(25.034189, 121.535979),
      infoWindow: InfoWindow(title: 'Family Mart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );
  /// Defined custom marker
  Marker restaurantMarker9= Marker(
      markerId: MarkerId('restaurant9'),
      position: LatLng(25.0330, 121.5654),
      infoWindow: InfoWindow(title: ''),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker10= Marker(
      markerId: MarkerId('restaurant10'),
      position: LatLng(25.034189, 121.535979),
      infoWindow: InfoWindow(title: 'Family Mart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );
  /// Defined custom marker
  Marker restaurantMarker11= Marker(
      markerId: MarkerId('restaurant11'),
      position: LatLng(25.0330, 121.5654),
      infoWindow: InfoWindow(title: ''),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker12= Marker(
      markerId: MarkerId('restaurant12'),
      position: LatLng(25.034189, 121.535979),
      infoWindow: InfoWindow(title: 'Family Mart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );
}
