import 'package:flutter/material.dart';
import 'package:good_share/circular_image.dart';
import 'package:good_share/constants.dart';
import 'package:good_share/review.dart';
import 'package:good_share/seller/seller_profile_screen.dart';

class BrandProfile extends StatelessWidget {
  final bool isSellerView;

  BrandProfile({this.isSellerView});

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
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Image(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          image: AssetImage('image/dessert_banner.jpg'),
                        ),

                        !isSellerView? Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: SizedBox(
                              height: 40.0,
                              child: RaisedButton(
                                splashColor: Colors.white,
                                color: Colors.pink[300],
                                textColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => OwnerProfile(isSellerView: false)));
                                },
                                child: Text(
                                  'Who is the owner?',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ) : Container(),
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
                              image: DecorationImage(fit: BoxFit.cover, image: AssetImage('image/yizhihsuan_logo.png'))),
                        )),
                  ],
                ),

              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Story', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),
                  SizedBox(width: 5.0),
                  isSellerView? IconButton(
                    icon: Icon(Icons.edit, color: Colors.pink[400]),
                    onPressed: (){print('editing');},
                  ) : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Text (Constants.brand_story),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Achievement', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),
                  SizedBox(width: 5.0),
                  isSellerView? IconButton(
                    icon: Icon(Icons.edit, color: Colors.pink[400]),
                    onPressed: (){print('editing');},
                  ) : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Text(Constants.brand_achievement),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Media report', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),
                  SizedBox(width: 5.0),
                  isSellerView? IconButton(
                    icon: Icon(Icons.edit, color: Colors.pink[400]),
                    onPressed: (){print('editing');},
                  ) : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Text(Constants.brand_media_report),
            ),

            ReviewCard(customerName: 'Jason', review: 'Delicious baked goods Stopped for a delicious Chinese style baked good, had a chocolate and walnut twisted bun which was unbelievably good. Service wasn\'t great and the place itself isn\'t particularly nice, but more than worth putting up with for the food.'),
            ReviewCard(customerName: 'Jessica',review: 'Masters of Pastry Making\nThis pastry shop tops a French patisserie! Not only do the pastries and cakes look amazing-elegant, they are absolutely scrumptious. Their prices are of another era.\n We were a party of two and left the shop with three large bags of assorted pastries and spent no more than 0!!!You can taste the goodness and freshness of every single ingredient because they pride themselves on using very little sugar and you can tell. Love it, love it, love it!'),
            ReviewCard(customerName: 'Maria',review: 'Awesome\nAwesome stuff you cant find most places, prices are good - they have these wonderful huge taro mochi and different steamed buns, like roast pork and red bean - they also have more western style sweets but I mainly go for the specialty stuff!'),
            ReviewCard(customerName: 'Jacky',review: 'Good Chinese bakery!\nFun and hopping Chinatown bakery with all the good Chinese baked goods you\'d want as well as western goods (you know, cakes, eclairs, etc.) This place hit the sweet spot us after a dim sum brunch - and the chocolate eclair that I had was just sweet enough, a nice light choux pastry that floated on air. Next time, I\'m hitting this place BEFORE dim sum so that I can cave into the temptation to buy one of everything before I fill up too much!'),
            ReviewCard(customerName: 'Shawn',review: 'Cheap, delicious Egg tarts and Japanese cheesecake amazing. Hot Horlicks was nice too. No wifi or toilets but there\'s very basic seating.'),
            ReviewCard(customerName: 'Zac',review: 'Good Options and Good Price The food here is delicious and come at a very reasonable price. They have desserts and then also meat filled pastries along with their drinks options. Everything is between 1-5 so it is extremely nice for a quick bite.'),
          ],
        ),
      ),
    );
  }
}
