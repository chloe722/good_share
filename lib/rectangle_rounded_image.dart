import 'package:flutter/material.dart';

class RectangleRoundedImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  RectangleRoundedImage({this.image, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image))),
    );
  }
}
