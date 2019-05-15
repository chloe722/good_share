import 'package:flutter/material.dart';
import 'package:good_share/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final List<LocationModel> locationFixtures = [
  LocationModel(
    name: 'CarreFour',
    logo: AssetImage('image/carrefour.png'),
    cover: AssetImage('image/careefour_store.jpg'),
    geolocation: LatLng(25.040212, 121.530843),
    items: [
      ItemModel(name: 'Fish', expiryTime: '10 : 00 : 20', remaining: 10),
    ],
  ),
  LocationModel(
    name: 'FamilyMart',
    logo: AssetImage('image/family_mart.png'),
    cover: AssetImage('image/family_mart_store.jpeg'),
    geolocation: LatLng(25.025640, 121.545078),
    items: [
      ItemModel(name: 'Riceball', expiryTime: '11 : 00 : 20', remaining: 5),
    ],
  ),
  LocationModel(
    name: 'Mister Donut',
    logo: AssetImage('image/mister_donut.png'),
    cover: AssetImage('image/mister_donut_shop.jpg'),
    geolocation: LatLng(25.026153, 121.543636),
    items: [
      ItemModel(
          name: 'Chocolate Donut', expiryTime: '10 : 00 : 20', remaining: 2),
    ],
  ),
  LocationModel(
    name: 'Sprint Vagie',
    logo: AssetImage('image/spring_vagetarian.jpeg'),
    cover: AssetImage('image/spring_vagetariant_rest.jpg'),
    geolocation: LatLng(25.026516, 121.5322264),
    items: [
      ItemModel(name: 'Vagie Bento', expiryTime: '10 : 00 : 20', remaining: 8),
    ],
  ),
  LocationModel(
    name: 'Sunmerry Cafe',
    logo: AssetImage('image/sunmerry.jpeg'),
    cover: AssetImage('image/sunmerry_bakery.jpg'),
    geolocation: LatLng(25.032904, 121.543374),
    items: [
      ItemModel(name: 'Croissant', expiryTime: '10 : 00 : 20', remaining: 7),
    ],
  ),
  LocationModel(
    name: 'Woo Bento',
    logo: AssetImage('image/woo_bento.jpeg'),
    cover: AssetImage('image/bento_shop.jpg'),
    geolocation: LatLng(25.030737, 121.550201),
    items: [
      ItemModel(name: 'Fish bento', expiryTime: '10 : 00 : 20', remaining: 4),
    ],
  ),
];
