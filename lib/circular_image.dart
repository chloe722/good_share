import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  CircularImage({this.label, this.image});

  final ImageProvider image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: label != null ? label : "",
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(fit: BoxFit.cover, image: image)),
      ),
    );
  }
}
