import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel {
  LocationModel(
      {this.name, this.logo, this.cover, this.items, this.geolocation});
  String name;
  ImageProvider logo;
  ImageProvider cover;
  List<ItemModel> items;
  LatLng geolocation;
}

class ItemModel {
  ItemModel({this.name, this.remaining, this.expiryTime});
  String name;
  String expiryTime;
  int remaining;
}

class GeolocationModel {
  GeolocationModel(this.lat, this.lon);
  double lat;
  double lon;
}
