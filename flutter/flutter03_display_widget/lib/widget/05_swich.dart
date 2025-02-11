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
  // bool _isChecked = false;
  // bool _isOk = false;
  Map<String, bool> lists = {
    "first": false,
    "second": false,
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: ListView(
        children: [
          Switch(
              value: lists["first"]!,
              onChanged: (value) {
                setState(() {
                  lists["first"] = value;
                });
              }),
          SwitchListTile(
              title: Text('동의합니다'),
              value: lists["second"]!,
              onChanged: (value) {
                // 널안전성 (null safety)
                // 1) 모든 변수는 null을 가지지 않는 다를 전재조건으로 가짐
                // 2) 컴파일 단계에서 모든 변수가 null을 가질 수 있는 지 확인
                // => 해당 변수가 null을 가질 수 있는 부분을 확인 ?, ??
                // 데이터 타입? 변수 : 해당 변수는 null을 가질 수 있다는 선언
                // => 변수! : 해당변수를 사용하는 시점에 확실히 null이 아닌 값을 가지고 있다는 선언
                setState(() {
                  lists["second"] = value;
                });
              }),
              TextButton(
                onPressed: (lists['first']! && lists['second']!) ? (){} : null,
                child: Text('등록'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.red,
                  disabledForegroundColor: Colors.black,
                ),
              )
        ],
      ),
    );
  }
}
