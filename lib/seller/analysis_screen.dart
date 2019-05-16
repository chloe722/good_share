import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import './charts.dart';

class AnalysisScreen extends StatefulWidget {
  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final activeChart = BehaviorSubject<Widget>()..add(YearlyChart());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: activeChart,
        builder: (context, snapshot) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Download your Business Report and Order form as a file to apply a lone with the bank even get investment.',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton.icon(
                        onPressed: () {
                          //TODO export CSV
                        },
                        color: Colors.amber[300],
                        textColor: Colors.grey[700],
                        icon: Icon(Icons.attach_file),
                        label: Text('Sales data csv'),
                      ),
                      RaisedButton.icon(
                        onPressed: () {
                          //TODO export CSV
                        },
                        color: Colors.pink[200],
                        textColor: Colors.grey[700],
                        icon: Icon(Icons.picture_as_pdf),
                        label: Text('Bussiness Profile'),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 30.0,
                  ),
                  // Image(
                  //   image: AssetImage('image/sale_chart.jpg'),
                  // ),
                  Container(child: snapshot.data),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: RaisedButton(
                            onPressed: () {
                              activeChart.add(YearlyChart());
                            },
                            color: Colors.amber[300],
                            textColor: Colors.grey[700],
                            child: Text('Year'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: RaisedButton(
                            onPressed: () {
                              activeChart.add(MonthlyChart());
                            },
                            color: Colors.amber[300],
                            textColor: Colors.grey[700],
                            child: Text('Month'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}

//
///// Example of a line chart rendered with dash patterns.
//class DashPatternLineChart extends StatelessWidget {
//  final List<charts.Series> seriesList;
//  final bool animate;
//
//  DashPatternLineChart(this.seriesList, {this.animate});
//
//  /// Creates a [LineChart] with sample data and no transition.
//  factory DashPatternLineChart.withSampleData() {
//    return new DashPatternLineChart(
//      _createSampleData(),
//      // Disable animations for image tests.
//      animate: false,
//    );
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new charts.LineChart(seriesList, animate: animate);
//  }
//
//  /// Create three series with sample hard coded data.
//  static List<charts.Series<LinearSales, int>> _createSampleData() {
//    final myFakeDesktopData = [
//      new LinearSales(0, 5),
//      new LinearSales(1, 25),
//      new LinearSales(2, 100),
//      new LinearSales(3, 75),
//    ];
//
//    var myFakeTabletData = [
//      new LinearSales(0, 10),
//      new LinearSales(1, 50),
//      new LinearSales(2, 200),
//      new LinearSales(3, 150),
//    ];
//
//    var myFakeMobileData = [
//      new LinearSales(0, 15),
//      new LinearSales(1, 75),
//      new LinearSales(2, 300),
//      new LinearSales(3, 225),
//    ];
//
//    return [
//      new charts.Series<LinearSales, int>(
//        id: 'Desktop',
//        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//        domainFn: (LinearSales sales, _) => sales.year,
//        measureFn: (LinearSales sales, _) => sales.sales,
//        data: myFakeDesktopData,
//      ),
//      new charts.Series<LinearSales, int>(
//        id: 'Tablet',
//        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//        dashPattern: [2, 2],
//        domainFn: (LinearSales sales, _) => sales.year,
//        measureFn: (LinearSales sales, _) => sales.sales,
//        data: myFakeTabletData,
//      ),
//      new charts.Series<LinearSales, int>(
//        id: 'Mobile',
//        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//        dashPattern: [8, 3, 2, 3],
//        domainFn: (LinearSales sales, _) => sales.year,
//        measureFn: (LinearSales sales, _) => sales.sales,
//        data: myFakeMobileData,
//      )
//    ];
//  }
//}
//
///// Sample linear data type.
//class LinearSales {
//  final int year;
//  final int sales;
//
//  LinearSales(this.year, this.sales);
//}
