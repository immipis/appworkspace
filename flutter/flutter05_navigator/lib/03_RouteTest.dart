import 'package:flutter/material.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      // home: FirstPage(),
      initialRoute: '/firstPage',
      routes: {
        //네비게이터를 활용해서 전환할 화면 등록 =>MaterialPageRoute를 생성
        '/firstPage': (ctx) => FirstPage(),
        '/secondPage': (ctx) => SecondPage(
              data: 'first request22',
            ),
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<StatefulWidget> {
  dynamic result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () /*async*/ {
              /*
              var data = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => SecondPage(data: 'first requst',),
                  ));
                  setState(() {
                    result = data;
                  });*/
              Navigator.pushNamed(context, '/secondPage').then((data){
                setState(() {
                  result = data;
                });
              });
            },
            child: Text("go to next page"),
          ),
          Text('$result'),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String data;

  SecondPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'second response');
            },
            child: Text("go to pre page"),
          ),
          Text('$data'),
        ],
      ),
    );
  }
}
