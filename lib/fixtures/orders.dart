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
            name: 'cake',
            price: 10.0,
            expiryTime: '10 : 00 : 20',
            remaining: 10,
            image: 'image/cake.jpg'),
        quantity: 2),
    OrderItemModel(
        item: ItemModel(
            name: 'chocolate pinapple',
            price: 10.0,
            expiryTime: '10 : 00 : 20',
            remaining: 10,
            image: 'image/choco_pinapple.jpg'),
        quantity: 2),
    OrderItemModel(
        item: ItemModel(
            name: 'Cookie',
            price: 10.0,
            expiryTime: '10 : 00 : 20',
            remaining: 10,
            image: 'image/cookie.jpg'),
        quantity: 2),
  ]),
  OrderModel(
      location: location,
      number: '1010',
      collectionTime: DateTime.now().subtract(Duration(hours: 2)),
      items: [
        OrderItemModel(
            item: ItemModel(
                name: 'Pinapple',
                price: 10.0,
                expiryTime: '10 : 00 : 20',
                remaining: 10,
                image: 'image/pianapple.jpg'),
            quantity: 2)
      ]),
  OrderModel(
      location: location,
      number: '1009',
      collectionTime: DateTime.now().subtract(Duration(hours: 3, minutes: 33)),
      items: [
        OrderItemModel(
            item: ItemModel(
                name: 'Macaron',
                price: 10.0,
                expiryTime: '10 : 00 : 20',
                remaining: 10,
                image: 'image/macaron.jpg'),
            quantity: 2)
      ])
];

final List<OrderModel> ordersFixtures2 = List()
  ..add(
    OrderModel(
        location: location,
        number: '1012',
        collectionTime: null,
        isNewOrder: true,
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
