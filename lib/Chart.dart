import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class ChartState extends State<Chart> {
  static int income=0;
  static int expense=0;

  GlobalKey<AnimatedCircularChartState> _chartKey;

  @override
  Widget build(BuildContext context) {
    getSharedPreferences();

    return new AnimatedCircularChart(
      key: _chartKey,
      size: const Size(300.0, 300.0),
      initialChartData: data,
      chartType: CircularChartType.Pie,
      percentageValues: true,
    );


  }
  List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(56.0, Colors.redAccent, rankKey: 'Income'),
        new CircularSegmentEntry(44.0, Colors.greenAccent, rankKey: 'Expense'),

      ],
      rankKey: 'Wallet Situation',
    ),
  ];

  getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getInt("income"));
    print(prefs.getInt("expense"));
    ChartState.income = prefs.getInt("income");
    ChartState.expense=prefs.getInt("expense");
  }

}

class Chart extends StatefulWidget{
  @override
  ChartState createState() => new ChartState();

}
