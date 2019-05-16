import 'package:flutter/material.dart';
import 'package:good_share/constants.dart';

class OwnerProfile extends StatelessWidget {
  final bool isSellerView;

  OwnerProfile({this.isSellerView});

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
            SizedBox(height: 60.0),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 130.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage('image/japan_women.png'))),
                  ),
                  Text ('Emily', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),


                  isSellerView ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text('Write your story', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),
                        SizedBox(width: 5.0),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.pink[400]),
                          onPressed: (){print('editing');},
                        ),
                      ],
                    ),
                  ) : Container(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                    child: Text (Constants.owner_story),
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
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(
                        alignment: Alignment.centerLeft,child: Text(Constants.owner_achievement)),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('Media report', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),
                      ),
                      SizedBox(width: 5.0),
                      isSellerView? IconButton(
                        icon: Icon(Icons.edit, color: Colors.pink[400]),
                        onPressed: (){print('editing');},
                      ) : Container(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(alignment: Alignment.centerLeft,child: Text(Constants.owner_media_report)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
