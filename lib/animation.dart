import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;

  const FadeIn({Key key, this.child}) : super(key: key);

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: controller.value, child: widget.child);
  }
}
