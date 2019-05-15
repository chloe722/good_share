
import 'package:flutter/material.dart';
import 'package:good_share/buyer_screen.dart';
import 'package:good_share/seller/seller_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  _loginAsBuyer(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BuyerScreen()));
  }

  _loginAsSeller(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SellerScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Image(
            image: AssetImage('image/logo_goodshare.png'),
          ),
          LoginButton(title: 'Login as Buyer', onPress: _loginAsBuyer()),
          LoginButton(title: 'Login as Seller', onPress: _loginAsSeller())
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String title;
  final Function onPress;

  LoginButton({this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        onPressed: () {
          onPress();
        },
          child: Text('Login in as buyer')),
    );
  }
}

