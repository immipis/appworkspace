import 'package:flutter/material.dart';
import 'package:josungmin/screens/board/list_screen.dart';
import 'package:josungmin/screens/board/read_screen.dart';
import 'package:josungmin/screens/board/insert_screen.dart';
import 'package:josungmin/screens/board/update_screen.dart';
import 'package:josungmin/screens/board/book_screen.dart';



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
        '/board/book': (context) => BookScreen(),
      },
    );
  }
}
