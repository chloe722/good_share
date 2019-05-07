import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  CircularImage({this.store, this.image});

  final String image;
  final String store;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: store,
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(fit: BoxFit.cover,
                image: AssetImage(image))
        ),
      ),
    );
  }
}
