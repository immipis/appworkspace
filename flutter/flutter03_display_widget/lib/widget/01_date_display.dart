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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: ListView(children: [
        // Text Widget
        Text(
          'This is Text',
          style: TextStyle(
            color: Colors.red,
            backgroundColor: Colors.green,
            fontSize: 30.0,
          ),
          textAlign: TextAlign.center,
        ),
        // Iamge Widget
        //asset에 선언된 경로에 있는 이미지를 불러오는 함수
        Image.asset('images/flower.jpg'),
        //Icon Widget
        Icon(
          Icons.favorite,
          color: Colors.green,
          size: 100,
        ),
        Icon(
          Icons.access_alarm,
          color: Colors.green,
          size: 100,
        ),
      ]),
    );
  }
}
