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
  TimeOfDay? _selectedTime = null;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    // initialTime: TimeOfDay(hour:12,minute: 0),
                  ).then((time) {
                    setState(() {
                      _selectedTime = time;
                    });
                  });
                },
                child: Text('Show TimePicker')),
            if (_selectedTime != null)
              Text("${_selectedTime?.hour} : ${_selectedTime?.minute}"),
          ],
        ),
      ),
    );
  }
}
