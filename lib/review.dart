import 'package:flutter/material.dart';
import 'package:good_share/ratingbar.dart';

class ReviewCard extends StatelessWidget {
  final String customerName;
  final String review;

  ReviewCard({this.customerName, this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(customerName),
            RatingBar(),
            Text(review)
          ],
        ),
      ),
    );
  }
}
