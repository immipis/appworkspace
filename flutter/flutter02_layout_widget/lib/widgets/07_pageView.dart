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
  final PageController _pageController = PageController(
    initialPage: 2, //처음 열린때 사용하느 ㄴ페이지
    keepPage: true, //지금 보고 있는 페이지 저장?
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout - PageView Widget"),
      ),
      body: PageView(
        //controller: , // 선택사항
        controller: _pageController,
        children: [
          firstPage(),
          secondPage(),
        ],
      ),
    );
  }
}


ListView firstPage() {
  return ListView(
    children: [
      ListTile(
        title: Text("ListView"),
        subtitle: Text('Using ListTitle'),
        trailing: Icon(Icons.more_vert),
        onTap: () => print('first'),
      ),
      ListTile(
        leading: FlutterLogo(size: 50.0),
        title: Text("Fluter"),
        trailing: Icon(Icons.autorenew),
        onLongPress: () {
          print('second');
        },
      ),
      ListTile(
        leading: Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: Text("Contacts"),
        subtitle: Text('Add Phone Number'),
        trailing: Icon(Icons.add),
      ),
      ListTile(
        title: Text("ListView"),
        subtitle: Text('Using ListTitle'),
        trailing: Icon(Icons.more_vert),
        onTap: () => print('first'),
      ),
      ListTile(
        leading: FlutterLogo(size: 50.0),
        title: Text("Fluter"),
        trailing: Icon(Icons.autorenew),
        onLongPress: () {
          print('second');
        },
      ),
      ListTile(
        leading: Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: Text("Contacts"),
        subtitle: Text('Add Phone Number'),
        trailing: Icon(Icons.add),
      ),
      ListTile(
        title: Text("ListView"),
        subtitle: Text('Using ListTitle'),
        trailing: Icon(Icons.more_vert),
        onTap: () => print('first'),
      ),
      ListTile(
        leading: FlutterLogo(size: 50.0),
        title: Text("Fluter"),
        trailing: Icon(Icons.autorenew),
        onLongPress: () {
          print('second');
        },
      ),
      ListTile(
        leading: Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: Text("Contacts"),
        subtitle: Text('Add Phone Number'),
        trailing: Icon(Icons.add),
      ),
      ListTile(
        title: Text("ListView"),
        subtitle: Text('Using ListTitle'),
        trailing: Icon(Icons.more_vert),
        onTap: () => print('first'),
      ),
      ListTile(
        leading: FlutterLogo(size: 50.0),
        title: Text("Fluter"),
        trailing: Icon(Icons.autorenew),
        onLongPress: () {
          print('second');
        },
      ),
      ListTile(
        leading: Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: Text("Contacts"),
        subtitle: Text('Add Phone Number'),
        trailing: Icon(Icons.add),
      ),
    ],
  );
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
