import 'package:flutter/material.dart';
import 'package:good_share/buyer_screen.dart';
import 'package:good_share/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodShare',
      theme: ThemeData(
        primarySwatch: Colors.pinkAccent[300],
      ),
      home: LoginScreen(),
    );
  }
}



