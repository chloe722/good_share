import 'dart:ui';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SalesPoint {
  final String label;
  final int sales;
  final charts.Color color;

  SalesPoint(this.label, this.sales, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class YearlyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final yearData = [
      SalesPoint('2016', 12, Colors.red),
      SalesPoint('2017', 42, Colors.yellow),
      SalesPoint('2018', 55, Colors.green),
    ];

    var series = [
      charts.Series(
        id: 'year-sales',
        domainFn: (SalesPoint clickData, _) => clickData.label,
        measureFn: (SalesPoint clickData, _) => clickData.sales,
        colorFn: (SalesPoint clickData, _) => clickData.color,
        data: yearData,
      ),
    ];
    var chart = charts.BarChart(
      series,
      animate: true,
    );
    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          chartWidget,
        ],
      ),
    );
  }
}

class MonthlyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final monthData = [
      SalesPoint('Jan', 39, Colors.green),
      SalesPoint('Feb', 38, Colors.orange),
      SalesPoint('Mar', 55, Colors.green),
      SalesPoint('Apr', 35, Colors.red),
      SalesPoint('May', 60, Colors.green),
    ];

    var series = [
      charts.Series(
        id: 'month-sales',
        domainFn: (SalesPoint point, _) => point.label,
        measureFn: (SalesPoint point, _) => point.sales,
        colorFn: (SalesPoint point, _) => point.color,
        data: monthData,
      ),
    ];
    var chart = charts.BarChart(
      series,
      animate: true,
    );
    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          chartWidget,
        ],
      ),
    );
  }
}
