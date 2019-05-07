import 'package:flutter/material.dart';
import 'package:good_share/card_item.dart';
import 'package:good_share/circular_image.dart';

class DetailScreen extends StatefulWidget {
  final String store;
  final String remainNumber;
  final String countDown;
  final String logo;
  final String coverImage;


  DetailScreen({this.store, this.remainNumber, this.countDown, this.logo, this.coverImage});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

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
                          image: AssetImage(widget.coverImage),
                        ),
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.21,
                      right: MediaQuery.of(context).size.width * 0.1,
                      child: CircularImage(store: widget.store, image: widget.logo)
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
                          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non enim fringilla, sagittis ipsum sit amet, blandit velit. Vivamus quis arcu dictum leo accumsan feugiat. Maecenas sagittis egestas purus. Mauris cursus laoreet pellentesque. Mauris a tincidunt urna, in luctus diam. Duis finibus eros quis tristique blandit. Cras vel mi auctor, rutrum metus ut, volutpat arcu. Nam convallis aliquet nisi, vitae pulvinar enim semper in. Quisque porta urna at dui dapibus, id vehicula odio viverra. Donec cursus tempor blandit.\n Nam dui nulla, vulputate id congue ac, hendrerit a nisi. Praesent feugiat quis eros vitae convallis.\n Nam tincidunt mauris sodales nulla viverra sodales. Quisque ac nisi dignissim, congue magna vitae, dapibus neque. Nunc elementum sapien vitae arcu pulvinar tincidunt.')),
                        CardItem(itemImage: 'image/salmon_rice_ball.jpg',itemTitle: 'Salmon Rice ball', remainNumber: '8',originalPrice: '30',discountedPrice: '15'),
                        CardItem(itemImage: 'image/vagetaian_bento.jpeg',itemTitle: 'Vagetarian Bento', remainNumber: '4',originalPrice: '120',discountedPrice: '60',),
                        CardItem(itemImage: 'image/macha_donut.jpeg',itemTitle: 'Macha Donut',remainNumber: '5',originalPrice: '40', discountedPrice: '20',),
                        CardItem(itemImage: 'image/crossiant.jpeg', itemTitle: 'Crossiant',remainNumber: '6',originalPrice: '35',discountedPrice: '18',)
                    ],
                  ),
                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: RaisedButton(
                        splashColor: Colors.white,
                        color: Colors.green[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: (){
                          //TODO go to purchase page
                        },
                        child: Text('Buy', style: TextStyle(
                          color: Colors.white
                        ),),
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
