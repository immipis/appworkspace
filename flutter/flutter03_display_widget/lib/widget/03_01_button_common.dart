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
        title: Text('Display - Common Button Widget'),
      ),
      body: ListView(
        children: [
          wrapButton(textButton()),
          wrapButton(outlinedButton()),
          wrapButton(elevatedButton()),
          wrapButton(textButtonIcon()),
          Row(
            children: [textButton(),outlinedButton(),textButtonIcon()],
          )
        ],
      ),
    );
  }
}

Padding wrapButton(Widget button) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: button,
  );
}

// 1.TextButton

TextButton textButton() {
  return TextButton(
    onPressed: () {}, // 버튼을 클릭했을떄 필수
    onLongPress: () {}, // 버튼을 길게 클릭했을떄 선택
    onHover: (isHovered) {}, // 버튼에 마우스를 올렸을때 선택 isHovered 불린 타입
    style: TextButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
    ),
    child: Text(
      "Text Button",
      style: TextStyle(fontSize: 20.0),
    ),
  );
}
// 2.OutlinedButton

OutlinedButton outlinedButton() {
  return OutlinedButton(
    onPressed: () {}, // 버튼을 클릭했을떄 필수
    onLongPress: () {}, // 버튼을 길게 클릭했을떄 선택
    onHover: (isHovered) {}, // 버튼에 마우스를 올렸을때 선택 isHovered 불린 타입
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        side: BorderSide(
          color: Colors.black,
          width: 3.0,
          style: BorderStyle.solid,
        )),
    child: Text(
      "outlinedButton",
      style: TextStyle(fontSize: 20.0),
    ),
  );
}
// 3.ElevatedButton

ElevatedButton elevatedButton() {
  return ElevatedButton(
    onPressed: () {}, // 버튼을 클릭했을떄 필수
    onLongPress: () {}, // 버튼을 길게 클릭했을떄 선택
    onHover: (isHovered) {}, // 버튼에 마우스를 올렸을때 선택 isHovered 불린 타입
    style: TextButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
      elevation: 20.0,
    ),
    child: Text(
      "elevatedButton",
      style: TextStyle(fontSize: 20.0),
    ),
  );
}

// 4.TextButton + Icon
TextButton textButtonIcon() {
  return TextButton.icon(
    onPressed: null,
    label: Text(''),
    icon: Icon(
      Icons.home,
      size: 20,
    ),
    style: TextButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,

      disabledForegroundColor: Colors.green,
      disabledBackgroundColor: Colors.green,
    ),
  );
}
// 5.OverFlowBar
