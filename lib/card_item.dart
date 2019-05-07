import 'package:flutter/material.dart';
import 'package:good_share/rectangle_rounded_image.dart';

class CardItem extends StatefulWidget {
  final String itemImage;
  final String itemTitle;
  final String remainNumber;
  final String discountedPrice;
  final String originalPrice;


  CardItem({this.itemImage, this.itemTitle, this.remainNumber,
      this.discountedPrice, this.originalPrice});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 8.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RectangleRoundedImage(image: widget.itemImage),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: Text(widget.itemTitle, style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: RichText(text: TextSpan(text: '\$ ${widget.originalPrice} ' , style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey[700] ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: Text('\$ ${widget.discountedPrice}', style: TextStyle(fontSize: 16.0 , fontWeight: FontWeight.w500),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: Text('${widget.remainNumber} left', style: TextStyle(color: Colors.red[400]),),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
