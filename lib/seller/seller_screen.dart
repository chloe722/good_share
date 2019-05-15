import 'package:flutter/material.dart';
import 'package:good_share/seller/brand_profile_screen.dart';
import 'package:good_share/seller/seller_profile_screen.dart';

class SellerScreen extends StatefulWidget {
  @override
  _SellerScreenState createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    BrandProfile(),
    OwnerProfile(),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.branding_watermark),
                title: Text('brand')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.branding_watermark),
                title: Text('Analysis')
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
