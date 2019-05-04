import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      child:GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target: LatLng(25.032657, 121.533047), zoom: 14),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {restaurantMarker, restaurantMarker2, restaurantMarker3, restaurantMarker4, restaurantMarker5, restaurantMarker6},
        myLocationEnabled: true,
          ),
    );
  }


  /// Defined custom marker
  Marker restaurantMarker= Marker(
    markerId: MarkerId('carreFour'),
    position: LatLng(25.040212, 121.530843),
    infoWindow: InfoWindow(title: 'CarreFour'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker2= Marker(
      markerId: MarkerId('familyMart'),
      position: LatLng(25.034189, 121.535979),
      infoWindow: InfoWindow(title: 'Family Mart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  /// Defined custom marker
  Marker restaurantMarker3= Marker(
      markerId: MarkerId('misterDonut'),
      position: LatLng(25.026153, 121.543636),
      infoWindow: InfoWindow(title: 'Mister Donut'),
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
      markerId: MarkerId('Spring Vagetarian'),
      position: LatLng(25.026516, 121.5322264),
      infoWindow: InfoWindow(title: 'Spring Vagetarian'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker6= Marker(
      markerId: MarkerId('Sunmerry'),
      position: LatLng(25.032904, 121.543374),
      infoWindow: InfoWindow(title: 'Sunmerry Cafe'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );
  /// Defined custom marker
  Marker restaurantMarker7= Marker(
      markerId: MarkerId('wooBento'),
      position: LatLng(25.030737, 121.550201),
      infoWindow: InfoWindow(title: 'Woo Bento'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );
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
