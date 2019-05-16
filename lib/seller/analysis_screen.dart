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