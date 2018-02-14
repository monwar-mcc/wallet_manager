import 'package:flutter/material.dart';
import './Chart.dart' as Chart;
import './Expenses.dart' as Expenses;
import './Income.dart' as Income;

void main() {
  runApp(new MaterialApp(
      home: new MyTabs()
  ));
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {


  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Wallet Manager"),
            backgroundColor: Colors.teal,
            bottom: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.pie_chart)),
                  new Tab(icon: new Icon(Icons.shopping_basket)),
                  new Tab(icon: new Icon(Icons.monetization_on)),
                ]
            )
        ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new Chart.Chart(),
              new Expenses.Expense(),
              new Income.Income()
            ]
        )
    );
  }
}