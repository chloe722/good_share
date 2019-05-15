import 'package:flutter/material.dart';
import 'package:good_share/constants.dart';

class OwnerProfile extends StatelessWidget {
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text (Constants.owner_story),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Achievement', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),
                  ),
                  Text(Constants.owner_achievement),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Media Report', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),
                  ),
                  Text(Constants.owner_media_report),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
