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
  final TextEditingController editingController = TextEditingController(text: 'first');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Display - TextField Widget'),
      ),
      body: ListView(
        children: [
          Text('You Can Input Text.'),
          TextField(),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'inputName',
              helperText: 'korean langyage supprot',
            ),
            onSubmitted: (value) {
              print("==================== result : $value");
            },
          ),
          SizedBox(height: 20),
          TextField(
            controller: editingController,
            decoration: InputDecoration(labelText: 'input Info'),
          ),
          TextButton(
              onPressed: () {
                String info = editingController.text;
                print('Button $info');
              },
              child: Text('확인')
              ),
              Text('${editingController.text}'),
              // TextEditingController.text를 사용할 경우
              // textField 별로 서로 다른 컨드롤러를 사용하도록함
              TextField(
                controller: editingController,
              )
        ],
      ),
    );
  }
}
