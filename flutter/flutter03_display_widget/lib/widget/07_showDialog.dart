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
        title: Text('Display - AlertDialog with showDialog'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () => _dialogBuiler(context), child: Text('show')),
      ),
    );
  }
}

Future<void> _dialogBuiler(BuildContext context) {
  return showDialog(
      //비동기 작업 + AlertDialog Widget 생성
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('info'),
          content: Text('AlertDialog with showDigialog'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        );
      });
}
