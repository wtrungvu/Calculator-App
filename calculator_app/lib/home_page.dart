import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator Version 1.0"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: new Image(
                    image: AssetImage("images/calculator.png"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      labelText: "Enter Number One",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      labelText: "Enter Number Two",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "+",
                          style: new TextStyle(fontSize: 30.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.red,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {},
                      ),
                      new RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "-",
                          style: new TextStyle(fontSize: 30.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.green,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "x",
                          style: new TextStyle(fontSize: 30.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.blue,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {},
                      ),
                      new RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "÷",
                          style: new TextStyle(fontSize: 30.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.purple,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      labelText: "Result Will Show Here",
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: new SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: RaisedButton(
                        child: new Text(
                          "Reset",
                          style: new TextStyle(fontSize: 30.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.orange,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {},
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
