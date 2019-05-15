import 'package:flutter/material.dart';
import 'package:good_share/constants.dart';

class BrandProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          primary: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(fit: BoxFit.cover, image: AssetImage('japan_women.png'))),
                ),
                Text ('Owner Story'),
                Text (Constants.owner_story),
                Text(Constants.owner_achievement),
                Text(Constants.owner_media_report),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
