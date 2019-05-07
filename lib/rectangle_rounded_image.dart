import 'package:flutter/material.dart';

class RectangleRoundedImage extends StatelessWidget {
  final String image;

  RectangleRoundedImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image))),
    );
  }
}
