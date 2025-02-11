import 'package:flutter/material.dart';
import 'package:flutter06_http_board/screens/board/insert_screen.dart';
import 'package:flutter06_http_board/screens/board/list_screen.dart';
import 'package:flutter06_http_board/screens/board/read_screen.dart';
import 'package:flutter06_http_board/screens/board/update_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Board Flutter Demo',
      // home: ListScreen(),
      initialRoute: '/board/list',
      routes: {
        '/board/list': (context) => ListScreen(),
        '/board/read': (context) => ReadScreen(),
        '/board/insert': (context) => InsertScreen(),
        '/board/update': (context) => UpdateScreen(),
      },
    );
  }
}
