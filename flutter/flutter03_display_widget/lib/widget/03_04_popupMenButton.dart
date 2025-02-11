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

enum RGB { red, green, bule } //클래스와 같은 참조값 값을 제한함{}안에 있는 값만 사용가능

class _MyHomePageState extends State<MyHomePage> {
  RGB _selection = RGB.red;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Display PopupMenuButton Widget'),
      ),
      body: Center(
        child: PopupMenuButton(
          onSelected: (RGB result){
            _selection = result;
            print(_selection);
          },
            itemBuilder: (BuildContext context) => [
                  PopupMenuItem<RGB>(value: RGB.red, child: Text('red')),
                  PopupMenuItem<RGB>(value: RGB.green, child: Text('green')),
                  PopupMenuItem<RGB>(value: RGB.bule, child: Text('bule')),
                ]),
      ),
    );
  }
}
