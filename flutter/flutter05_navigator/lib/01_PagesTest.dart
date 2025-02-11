import 'package:flutter/material.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage() {
    print("firstPage Create");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //버튼을 클릭할 경우 새로운 페이지 전환
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => SecondPage(),
                ));
          },
          child: Text('Go To Next Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage() {
    print("SecondPage Create");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //버튼을 클릭할 경우 새로운 페이지 전환
            Navigator.pop(context);
          },
          child: Text('Go To Pri Page'),
        ),
      ),
    );
  }
}
