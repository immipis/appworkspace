import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Display Demo",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Fruit { apple, banana, orange }

class _MyHomePageState extends State<MyHomePage> {
  Fruit _fruit = Fruit.apple;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: ListView(
        children: [
          RadioListTile(
              title: Text("사과"),
              value: Fruit.apple, //해당 라디오가 가지는 값
              groupValue: _fruit,
              onChanged: (value) {
                setState(() {
                  _fruit = value!;
                  print(value);
                });
              }),
          RadioListTile(
              title: Text("오랜지"),
              value: Fruit.orange, //해당 라디오가 가지는 값
              groupValue: _fruit,
              onChanged: (value) {
                setState(() {
                  _fruit = value!;
                  print(value);
                });
              }),
          RadioListTile(
              title: Text("바나나"),
              value: Fruit.banana, //해당 라디오가 가지는 값
              groupValue: _fruit,
              onChanged: (value) {
                setState(() {
                  _fruit = value!;
                  print(value);
                });
              })
        ],
      ),
    );
  }
}
