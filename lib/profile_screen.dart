import 'package:flutter/material.dart';
import 'package:good_share/circular_image.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 110.0),
          CircularImage(image: 'image/avatar.jpg'),
          SizedBox(height: 20.0),
          Text('Viola Cheng', style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 30.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LabelItem(title: 'Money saved', value: '50 \$'),
              LabelItem(title: 'Food saved', value: '1000 g',),
              LabelItem(title: 'GHS reduced', value: '4500 g',),

            ],
          )

        ],
      ),
    );
  }
}


class LabelItem extends StatelessWidget {
  LabelItem({this.title, this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
        value,
          style: TextStyle(fontSize: 25, color: Colors.grey[700], fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.0),
        Text(
          title, style: TextStyle(fontSize: 14, color: Colors.orange[400]),
        )
      ],
    );
  }
}
