import 'package:flutter/material.dart';

class AnalysisScreen extends StatefulWidget {
  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('Download your Business Report and Order form as a file to apply a lone with the bank even get investment.', style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
          SizedBox(
            height: 30.0,
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  //TODO export CSV
                },
                color: Colors.amber[300],
                textColor: Colors.grey[700],
                child: Text('Export CSV'),
              ),

              RaisedButton(
                onPressed: () {
                  //TODO export CSV
                },
                color: Colors.pink[200],
                textColor: Colors.grey[700],
                child: Text('Export profile pdf'),
              )
            ],
          ),

          SizedBox(
            height: 30.0,
          ),
          Image(
            image: AssetImage('image/sale_chart.jpg'),
          ),

        ],
      ),
    );
  }
}
