import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String store;
  final String remainNumber;
  final String countDown;
  final String logo;


  DetailScreen({this.store, this.remainNumber, this.countDown, this.logo});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
