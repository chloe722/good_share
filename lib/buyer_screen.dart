import 'package:flutter/material.dart';
import 'package:good_share/map_screen.dart';
import 'package:good_share/profile_screen.dart';
import 'orders_screen.dart';

class BuyerScreen extends StatefulWidget {
  @override
  _BuyerScreenState createState() => _BuyerScreenState();
}

class _BuyerScreenState extends State<BuyerScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.pink[400],
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Map')),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text('Orders')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile')),
          ]),
      body: _children[_currentIndex],
    );
  }
}
