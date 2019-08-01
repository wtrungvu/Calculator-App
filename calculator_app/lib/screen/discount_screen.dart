import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class DiscountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discount Percent"),
      ),
      body: DiscountScreenWidget(),
    );
  }
}

class DiscountScreenWidget extends StatefulWidget {
  @override
  _DiscountScreenWidgetState createState() => _DiscountScreenWidgetState();
}

class _DiscountScreenWidgetState extends State<DiscountScreenWidget> {
  bool _validatePriceIsEmty = false;
  bool _validateDiscountIsEmty = false;
  final _controllerPrice = TextEditingController();
  final _controllerDiscount = TextEditingController();
  var _resultString = null;

  @override
  Widget build(BuildContext context) {
    const marginScreen = const EdgeInsets.all(20.0);
    var fontSizeScreen = 20.0;
    const marginWidget = const EdgeInsets.only(top: 20.0);
    var widthRaisedButton = 150.0;
    var heightRaisedButton = 50.0;
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: marginScreen,
//      color: Colors.deepPurple,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: Image(
                image: AssetImage("images/percent.png"),
              ),
            ),
            Container(
              margin: marginWidget,
              child: TextFormField(
                controller: _controllerPrice,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  fontSize: fontSizeScreen,
                ),
                decoration: InputDecoration(
                  labelText: "Giá gốc ban đầu",
                  prefixIcon: Icon(Icons.monetization_on),
                  hintText: "Nhập giá gốc ban đầu",
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        print("onPressed Clear Price");
                        _controllerPrice.clear();
                      }),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  errorText: _validatePriceIsEmty
                      ? 'Giá trị không được bỏ trống!'
                      : null,
                ),
              ),
            ),
            Container(
              margin: marginWidget,
              child: TextFormField(
                controller: _controllerDiscount,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  fontSize: fontSizeScreen,
                ),
                decoration: InputDecoration(
                  labelText: "Phần trăm giảm giá",
                  prefixIcon: Icon(Icons.shopping_cart),
                  hintText: "Nhập số phần trăm giảm giá",
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        print("onPressed Clear Discount");
                        _controllerDiscount.clear();
                      }),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  errorText: _validateDiscountIsEmty
                      ? 'Giá trị không được bỏ trống!'
                      : null,
                ),
              ),
            ),
            Container(
              margin: marginWidget,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: widthRaisedButton,
                    height: heightRaisedButton,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeScreen,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        if (_controllerPrice.text.isNotEmpty &&
                            _controllerDiscount.text.isNotEmpty) {
                          onClickedCalculate();
                        } else {
                          // print("Value is emty!");
                          _showDialog();
                        }
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                    ),
                  ),
                  Container(
                    width: widthRaisedButton,
                    height: heightRaisedButton,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0)),
                    child: RaisedButton(
                        color: Colors.red,
                        child: Text(
                          "Reset",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSizeScreen,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          onReseteClicked();
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  ),
                ],
              ),
            ),
            Container(
              margin: marginWidget,
              child: Text(
                  "=> Giá sau khi giảm giá là ${_resultString.toString()} VND",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  double calculateLogic(double price, double discount) {
    double percent = (100 - discount) / 100;
    double resultCalculate = price * percent;
    return resultCalculate;
  }

  void onClickedCalculate() {
    print("Calculate Clicked");
    try {
      double price = double.parse(_controllerPrice.text);
      double discount = double.parse(_controllerDiscount.text);
      double resultCalculate = calculateLogic(price, discount);

      // Format Result
      FlutterMoneyFormatter fmf =
          FlutterMoneyFormatter(amount: resultCalculate);
      print(fmf.output.withoutFractionDigits); // 12,345,678

      setState(() {
        _resultString = fmf.output.withoutFractionDigits;
      });
    } catch (e) {
      _showDialog();
    }
  }

  void onReseteClicked() {
    print("Reset Clicked");
    setState(() {
      _resultString = null;
      _controllerPrice.clear();
      _controllerDiscount.clear();
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Bạn chưa nhập đầy đủ giá trị!"),
            content: Text("Xin vui lòng bạn nhập đầy đủ!"),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
