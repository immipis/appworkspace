import "package:flutter/material.dart";

// runApp() : 가장 먼저 화면에 나타날 위젯 실행
void main() => runApp(HelloWorld());

// StatelessWidget : 변화 없이 화면 표시만읠 위한 위젯
class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 디자인
        title: "first flutter app",
        home: Scaffold( //머테리얼의 실질적 뼈대
          appBar: AppBar(
            title: const Text('Hello World Demo'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ));
  }
}
