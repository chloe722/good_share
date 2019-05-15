import 'dart:math';

import 'package:flutter/material.dart';
import 'package:good_share/fixtures/orders.dart';
import 'package:good_share/models.dart';
import 'package:good_share/scaffold.dart';
import 'package:signature/signature.dart';
import 'package:rxdart/rxdart.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = BehaviorSubject<List<OrderModel>>()..add(ordersFixtures);
    Future.delayed(Duration(seconds: 5)).then((_) {
      orders.add(ordersFixtures2);
    });
    Future.delayed(Duration(seconds: 6)).then((_) {
      orders.close();
    });
    return StreamBuilder<List<OrderModel>>(
        stream: orders,
        builder: (context, snapshot) {
          return ListView(
            children: (snapshot.data ?? []).map((order) {
              return OrderItem(order: order);
            }).toList(),
          );
        });
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({Key key, this.order}) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final decoration =
        order.collectionTime == null ? null : TextDecoration.lineThrough;
    final collection = order.collectionTime == null
        ? null
        : Text('Collected ${order.collectionTime.toString()}');
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => CommonScaffold(
                  child: OrderDetailScreen(order: order),
                )));
      },
      leading: Text(
        order.number,
        style: TextStyle(fontWeight: FontWeight.bold, decoration: decoration),
      ),
      trailing: Text("NTD\$${order.total}"),
      title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: order.items
              .map((item) => Container(
                      child: Text(
                    '${item.quantity}x ${item.item.name}',
                    style: TextStyle(decoration: decoration),
                  )))
              .toList()),
      subtitle: collection,
    );
  }
}

class OrderDetailScreen extends StatelessWidget {
  final OrderModel order;

  const OrderDetailScreen({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signSize = min(MediaQuery.of(context).size.width * 0.9,
        MediaQuery.of(context).size.height * 0.9);
    return CommonScaffold(
        child: ListView(children: <Widget>[
      OrderItem(order: order),
      Container(
          child: Signature(
        width: signSize,
        height: signSize,
      )),
      ButtonBar(
        children: <Widget>[
          RaisedButton.icon(
            icon: Icon(Icons.check),
            label: Text("Mark collected"),
            onPressed: () {},
          )
        ],
      )
    ]));
  }
}
