
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Restaurants {




  /// Defined custom marker
  Marker restaurantMarker = Marker(
      markerId: MarkerId('restaurant'),
      position: LatLng(25.0330, 121.5654),
      infoWindow: InfoWindow(title: ''),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );

  Marker restaurantMarker2 = Marker(
      markerId: MarkerId('restaurant'),
      position: LatLng(25.034189, 121.535979),
      infoWindow: InfoWindow(title: 'Family Mart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
  );
}