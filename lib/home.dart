import 'package:flutter/material.dart';
import 'package:good_share/map_screen.dart';
import 'package:good_share/profile_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapScreen(),
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
        fixedColor: Colors.pink[300],
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Map')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
            title: Text('Profile')
        ),
      ]),
      body: _children[_currentIndex],
    );
  }
}


