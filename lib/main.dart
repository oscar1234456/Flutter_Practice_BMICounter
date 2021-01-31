import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 測試標題',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: "Counter"),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _height,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: "身高(cm)",
                ),
              ),
              TextField(
                controller: _weight,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: "體重(kg)",
                ),
              ),
              Text(content ?? ""),
              RaisedButton(
                onPressed: () {
                  print(_height.text);
                  print(_weight.text);
                  var h = double.parse(_height.text) / 100.0;
                  var w = double.parse(_weight.text);
                  var bmi = w / (h * h);
                  content = "您的ＢＭＩ： $bmi";
                  setState(() {});
                },
                child: Text(
                  "輸入",
                ),
              ),
            ],
          ),
        ));
  }
}
