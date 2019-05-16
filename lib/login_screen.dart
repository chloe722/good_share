
import 'package:flutter/material.dart';
import 'package:good_share/buyer_screen.dart';
import 'package:good_share/seller/seller_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('image/logo_goodshare.png'),
            ),
            LoginButton(title: 'Login as Buyer', buttonColor: Colors.amber[200], textColor: Colors.grey[700], context: context, isBuyerScreen: true,),
            SizedBox(height: 30.0),
            LoginButton(title: 'Login as Seller', buttonColor: Colors.pink[200], textColor: Colors.grey[700], context: context, isBuyerScreen: false,)
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final BuildContext context;
  final bool isBuyerScreen;

  LoginButton({this.title, this.buttonColor, this.textColor, this.context, this.isBuyerScreen});

  _loginAsBuyer(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BuyerScreen()));
  }

  _loginAsSeller(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SellerScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        color: buttonColor,
        textColor: textColor,
        onPressed: () {

          if (isBuyerScreen) {
            _loginAsBuyer();
          } else {
            _loginAsSeller();
          }
        },
          child: Text('Login in as buyer')),
    );
  }
}

