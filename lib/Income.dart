import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeState extends State<Income> {
   TextEditingController _textControllerIncome = new TextEditingController();
    static int previousIncome=0;


  void handleSubmitted(String text) {
    getSharedPreferences();
    int value=int.parse(_textControllerIncome.text);
    previousIncome=previousIncome+value;
    saveValues(previousIncome);
    print(previousIncome);
    _textControllerIncome.clear();
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Total Income '+previousIncome.toString()),
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
                    hintText: "Enter Todays Income "
                ),
                controller: _textControllerIncome,
                onSubmitted: handleSubmitted,
              ),
              new Container(
                margin: const EdgeInsets.all(8.0),
                child: new RaisedButton(onPressed: () => handleSubmitted(_textControllerIncome.text),
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

class Income extends StatefulWidget{
  @override
  IncomeState createState() => new IncomeState();

}

saveValues(int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("income", value);

}

getSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  IncomeState.previousIncome = prefs.getInt("income");
}