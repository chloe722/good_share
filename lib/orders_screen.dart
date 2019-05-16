import 'dart:math';

import 'package:flutter/material.dart';
import 'package:good_share/fixtures/orders.dart';
import 'package:good_share/models.dart';
import 'package:good_share/scaffold.dart';
import 'package:signature/signature.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';

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
            padding: EdgeInsets.only(top: 100.0),
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

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CommonScaffold(
                      child: OrderDetailScreen(order: order),
                    )));
          },
          leading: Text(
            order.number,
            style:
                TextStyle(fontWeight: FontWeight.bold, decoration: decoration),
          ),
          trailing: Text("NTD\$ ${order.total}"),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: order.items
                  .map((item) => Container(
                          child: Row(
                        children: <Widget>[
                          Text(
                            '${item.quantity} x ${item.item.name}',
                            style: TextStyle(decoration: decoration),
                          ),
                        ],
                      )))
                  .toList()),
          subtitle: getSubtitle(),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Divider(
            height: 1.0,
            color: Colors.grey[700],
          ),
        )
      ]),
    );
  }

  Widget getSubtitle() {
    if (order.collectionTime != null) {
      final dateFormat = DateFormat('HH:mm');
      return Text('Collected ${dateFormat.format(order.collectionTime)}');
    } else if (order.isNewOrder == true) {
      return Text('New Order',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.amber[300]));
    } else {
      return Text('Not collected',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent));
    }
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
      SizedBox(height: 30.0),
      Container(
          width: signSize,
          height: signSize,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.pink[300], width: 2.0))),
          child: Signature(
            backgroundColor: Colors.grey[200],
            width: signSize,
            height: signSize,
          )),
      SizedBox(height: 10.0),
      Text(
        'Please sign',
        textAlign: TextAlign.center,
      ),
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton.icon(
            color: Colors.amber[300],
            icon: Icon(Icons.check),
            label: Text("Mark collected"),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => CollectItemDoneDialog());
            },
          )
        ],
      )
    ]));
  }
}

class CollectItemDoneDialog extends StatefulWidget {
  @override
  _CollectItemDoneDialogState createState() => _CollectItemDoneDialogState();
}

class _CollectItemDoneDialogState extends State<CollectItemDoneDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Text('Invoice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500))),
            SizedBox(height: 30),
            LabelItemInvoice(title: 'Company', value: 'Yi zhi shuan'),
            LabelItemInvoice(title: 'Date', value: '2019.10.10'),
            LabelItemInvoice(title: 'Customer', value: 'Sara'),
            LabelItemInvoice(title: 'Collecting time', value: '22:00'),
            LabelItemInvoice(title: 'Collected items', value: '2 x Macaron'),
            LabelItemInvoice(title: 'Total', value: '50 \$'),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Container(
                    width: 100.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[700])),
                    child: Image(
                      height: 50,
                      width: 50.0,
                      image: AssetImage('image/signature.png'),
                      alignment: Alignment.center,
                    )),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.amber[300],
                textColor: Colors.grey[700],
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LabelItemInvoice extends StatelessWidget {
  final String title;
  final String value;

  LabelItemInvoice({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Row(
            children: <Widget>[
              Text('$title:',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700], fontSize: 16.0)),
              SizedBox(width: 15),
              Text('$value',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700], fontSize: 16.0)),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
