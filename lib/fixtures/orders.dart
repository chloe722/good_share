import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models.dart';

final location = LocationModel(
  name: 'Mister Donut',
  logo: AssetImage('image/mister_donut.png'),
  cover: AssetImage('image/mister_donut_shop.jpg'),
  geolocation: LatLng(25.026153, 121.543636),
  items: [],
);

final List<OrderModel> ordersFixtures = [
  OrderModel(location: location, number: '1011', collectionTime: null, items: [
    OrderItemModel(
        item: ItemModel(
            name: 'Bread',
            price: 10.0,
            expiryTime: '10 : 00 : 20',
            remaining: 10),
        quantity: 2),
    OrderItemModel(
        item: ItemModel(
            name: 'Butter',
            price: 10.0,
            expiryTime: '10 : 00 : 20',
            remaining: 10),
        quantity: 2),
    OrderItemModel(
        item: ItemModel(
            name: 'Milk',
            price: 10.0,
            expiryTime: '10 : 00 : 20',
            remaining: 10),
        quantity: 2),
  ]),
  OrderModel(location: location, number: '1010', collectionTime: null, items: [
    OrderItemModel(
        item: ItemModel(
            name: 'Bread',
            price: 10.0,
            expiryTime: '10 : 00 : 20',
            remaining: 10),
        quantity: 2)
  ]),
  OrderModel(
      location: location,
      number: '1010',
      collectionTime: DateTime.now(),
      items: [
        OrderItemModel(
            item: ItemModel(
                name: 'Bread',
                price: 10.0,
                expiryTime: '10 : 00 : 20',
                remaining: 10),
            quantity: 2)
      ])
];

final List<OrderModel> ordersFixtures2 = List()
  ..add(
    OrderModel(
        location: location,
        number: '1010',
        collectionTime: null,
        items: [
          OrderItemModel(
              item: ItemModel(
                  name: 'Bread',
                  price: 10.0,
                  expiryTime: '10 : 00 : 20',
                  remaining: 10),
              quantity: 2)
        ]),
  )
  ..addAll(ordersFixtures);
