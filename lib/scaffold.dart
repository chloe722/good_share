import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget child;

  const CommonScaffold({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: child));
  }
}
