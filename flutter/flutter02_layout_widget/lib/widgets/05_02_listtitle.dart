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
        title: Text("Layout - ListTitle Widget"),
      ),
      body: firstPage(),
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
