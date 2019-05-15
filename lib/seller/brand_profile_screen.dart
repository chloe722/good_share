import 'package:flutter/material.dart';
import 'package:good_share/circular_image.dart';
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
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          image: AssetImage('image/dessert_banner.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.21,
                        right: MediaQuery.of(context).size.width * 0.1,
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(fit: BoxFit.cover, image: AssetImage('yizhihsuan_logo.png'))),
                        )),
                  ],
                ),
                Text ('Brand Story'),
                Text (Constants.brand_story),
                Text(Constants.brand_achievement),
                Text(Constants.brand_media_report),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
