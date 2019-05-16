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
  ItemModel({this.name, this.remaining, this.expiryTime, this.price, this.image});
  final String name;
  final String expiryTime;
  final int remaining;
  final double price;
  final String image;
}

class GeolocationModel {
  GeolocationModel(this.lat, this.lon);
  double lat;
  double lon;
}

class OrderModel {
  OrderModel(
      {@required this.number,
      @required this.location,
      @required this.items,
      this.collectionTime});

  final String number;
  final LocationModel location;
  final List<OrderItemModel> items;
  final DateTime collectionTime;

  int get quantity {
    return items
        .map((item) => item.quantity)
        .reduce((total, value) => total + value);
  }

  double get total {
    return items
        .map((item) => item.item.price * item.quantity)
        .reduce((total, value) => total + value);
  }
}

class OrderItemModel {
  final ItemModel item;
  final int quantity;

  OrderItemModel({this.item, this.quantity});
}
