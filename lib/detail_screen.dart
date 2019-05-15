import 'package:flutter/material.dart';
import 'package:good_share/card_item.dart';
import 'package:good_share/circular_image.dart';
import 'package:good_share/models.dart';
import 'package:good_share/constants.dart';
import 'package:good_share/purchase_success_dialog.dart';
import 'package:good_share/ratingbar.dart';
import 'package:good_share/rectangle_rounded_image.dart';
import 'package:good_share/seller/brand_profile_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailScreen extends StatefulWidget {
  final LocationModel location;

  DetailScreen({Key key, @required this.location}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var selectedItems = Map<String, int>();

  @override
  Widget build(BuildContext context) {
    final location = widget.location;

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
                          image: location.cover,
                        ),
                      ],
                    ),

                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.28,
                      left: MediaQuery.of(context).size.width * 0.05,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BrandProfile()));
                        },
                        child: Row(
                          children: <Widget>[
                            RatingBar(),
                            Text('(134)')
                          ],
                        ),
                      )
                  ),

                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.33,
                      left: MediaQuery.of(context).size.width * 0.05,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.map, color: Colors.green[400]),
                          SizedBox(width: 10.0,),
                          Text('No. 107, Section 3, Roosevelt Road,\n Daan District, Taipei, Taiwan'),

                        ],
                      )
                  ),

                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.40,
                      left: MediaQuery.of(context).size.width * 0.05,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.phone, color: Colors.green[400],),
                          SizedBox(width: 10.0,),
                          Text('+886-886-889')

                        ],
                      )
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.21,
                      right: MediaQuery.of(context).size.width * 0.1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BrandProfile()
                          ));
                        },
                        child: CircularImage(
                            label: location.name, image: location.logo),
                      )),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                          child: Text(
                              'Hello, are you fell sleeping? Get some cake and coffee for happiness! You can now rescue some of bread and gorgeous cakes.')),
                      CardItem(
                          itemImage: AssetImage(Constants.salmonRiceBallImage),
                          itemTitle: Constants.salmonRiceBall,
                          remainNumber: '8',
                          originalPrice: '30',
                          discountedPrice: '15'),
                      CardItem(
                        itemImage: AssetImage(Constants.vagetariantBentoImage),
                        itemTitle: Constants.vagetariantBento,
                        remainNumber: '4',
                        originalPrice: '120',
                        discountedPrice: '60',
                      ),
                      CardItem(
                        itemImage: AssetImage(Constants.machaDonutImage),
                        itemTitle: Constants.machaDonut,
                        remainNumber: '5',
                        originalPrice: '40',
                        discountedPrice: '20',
                      ),
                      CardItem(
                        itemImage: AssetImage(Constants.crossiantImage),
                        itemTitle: Constants.crossiant,
                        remainNumber: '6',
                        originalPrice: '35',
                        discountedPrice: '18',
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: RaisedButton(
                        splashColor: Colors.white,
                        color: Colors.green[400],
                        textColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return PurchaseDialog(
                                    selectedItems: selectedItems);
                              });
                        },
                        child: Text(
                          'Buy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PurchaseDialog extends StatefulWidget {
  final selectedItems;

  PurchaseDialog({this.selectedItems});

  @override
  _PurchaseDialogState createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends State<PurchaseDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: SelectedItemLabel(
                  image: AssetImage(Constants.machaDonutImage),
                  itemName: Constants.machaDonut,
                  quantities: 3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: SelectedItemLabel(
                  image: AssetImage(Constants.salmonRiceBallImage),
                  itemName: Constants.salmonRiceBall,
                  quantities: 2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: SelectedItemLabel(
                  image: AssetImage(Constants.vagetariantBentoImage),
                  itemName: Constants.vagetariantBento,
                  quantities: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text('Total: 50\$', style: TextStyle(fontSize: 20.0),),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.amber[300],
                textColor: Colors.grey[700],
                child: Text('Confirm'),
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return PurchaseSuccessDialog();
                      });

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}




class SelectedItemLabel extends StatelessWidget {
  final ImageProvider image;
  final String itemName;
  final int quantities;

  SelectedItemLabel({this.image, this.itemName, this.quantities});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RectangleRoundedImage(image: image, width: 35.0, height: 35.0),
          SizedBox(width: 20.0),
          Text(
            '$quantities $itemName',
            style: TextStyle(fontSize: 18.0),
          ),
        ]);
  }
}
