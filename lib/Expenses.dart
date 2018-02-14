import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpensesState extends State<Expense> {
  final TextEditingController _textControllerIncome = new TextEditingController();
  static int previousExpense=0;
  void _handleSubmitted(String text) {
    getSharedPreferences();
    int value=int.parse(_textControllerIncome.text);
    previousExpense=previousExpense+value;
    saveValues(previousExpense);
    print(previousExpense);
    _textControllerIncome.clear();
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Total Expense '+previousExpense.toString()),
      backgroundColor: Colors.blueGrey,
      duration: new Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new TextField(
                decoration: new InputDecoration(
                    hintText: "Enter Todays Expenses "
                ),
                controller: _textControllerIncome,
                onSubmitted: _handleSubmitted,
              ),
              new Container(
                margin: const EdgeInsets.all(8.0),
                child: new RaisedButton(onPressed: () => _handleSubmitted(_textControllerIncome.text),
                  color: Colors.teal,
                  child: new Text("Add Now",
                    style: new TextStyle(
                        color: Colors.white
                    ),
                  ),

                ),
              ),
            ],
          ),
        )
    );
  }

}

class Expense extends StatefulWidget{
  @override
  ExpensesState createState() => new ExpensesState();
}

saveValues(int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("expense", value);

}

getSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ExpensesState.previousExpense = prefs.getInt("expense");
}