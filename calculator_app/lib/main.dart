import 'package:calculator_app/screen/discount_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Calculator App",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: DiscountScreen()
//      HomePage(),
        );
  }
}
