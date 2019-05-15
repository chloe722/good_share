import 'package:flutter/material.dart';
import 'package:good_share/card_item.dart';
import 'package:good_share/circular_image.dart';
import 'package:good_share/models.dart';
import 'package:good_share/constants.dart';
import 'package:good_share/rectangle_rounded_image.dart';
import 'package:good_share/seller/brand_profile_screen.dart';

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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          BrandProfile();
                        }));
                      },
                      child: Positioned(
                          top: MediaQuery.of(context).size.height * 0.21,
                          right: MediaQuery.of(context).size.width * 0.1,
                          child: CircularImage(
                              label: location.name, image: location.logo)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non enim fringilla, sagittis ipsum sit amet, blandit velit. Vivamus quis arcu dictum leo accumsan feugiat. Maecenas sagittis egestas purus. Mauris cursus laoreet pellentesque. Mauris a tincidunt urna, in luctus diam. Duis finibus eros quis tristique blandit. Cras vel mi auctor, rutrum metus ut, volutpat arcu. Nam convallis aliquet nisi, vitae pulvinar enim semper in. Quisque porta urna at dui dapibus, id vehicula odio viverra. Donec cursus tempor blandit.\n Nam dui nulla, vulputate id congue ac, hendrerit a nisi. Praesent feugiat quis eros vitae convallis.\n Nam tincidunt mauris sodales nulla viverra sodales. Quisque ac nisi dignissim, congue magna vitae, dapibus neque. Nunc elementum sapien vitae arcu pulvinar tincidunt.')),
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
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.amber[300],
                child: Text('Confirm'),
                onPressed: () {
                  print(' Confirm');
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
