import 'package:flutter/material.dart';
import 'package:good_share/orders_screen.dart';
import 'package:good_share/seller/analysis_screen.dart';
import 'package:good_share/seller/brand_profile_screen.dart';
import 'package:good_share/seller/consult_chatbot.dart';
import 'package:good_share/seller/seller_profile_screen.dart';

class SellerScreen extends StatefulWidget {
  @override
  _SellerScreenState createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    OrdersScreen(),
    AnalysisScreen(),
    BrandProfile(isSellerView: true),
    OwnerProfile(isSellerView: true),
    ConsultChatbot(),
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
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text('Orders')),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                title: Text('Analysis')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.store),
                title: Text('brand')
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.help_outline),
                title: Text('Support')
            ),

          ]),
      body: _children[_currentIndex],
    );
  }
}
