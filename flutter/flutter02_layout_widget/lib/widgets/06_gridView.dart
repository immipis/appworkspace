import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Layout Widget',
      home: MyHomePage(),
    );
  }
}

//여기까지는 공통 코드
//여기서 부터 적용되는 위젯에 따라 수정
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout - GridView Widget"),
      ),
      body: secondPage(),
    );
  }
}

GridView secondPage() {
  int count = 0;
  return GridView.count(
    crossAxisCount: 3, //한행에 배치할 위젯 수
    crossAxisSpacing: 10, // 가로롤 위젯 간격
    mainAxisSpacing: 50, // 세로 위젯 간격
    children: [
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),
      Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.blue[(++count * 100)],
        alignment: Alignment.center,
        child: Text('$count'),
      ),

    ],
  );
}
