import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Http home',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _callAPI,
          child: Text('Call API'),
        ),
      ),
    );
  }

  void _callAPI() async {
    _boardDel(11);
  }

  void _boardList() async {
    // Flutter 에서 ajax를 지원하는 모듈 http 모듈(js의 fetch, jqury의 ajax)

    // 1) 경로, url  : 전체 조회 GET, http://192.168.0.11:8099/boardList
    var url = Uri.parse('http://192.168.0.11:8099/boardList');

    // 2) AJAX
    var response = await http.get(url);

    // 3) 응답처리
    if (response.statusCode == 200) {
      //서버에서 응답하는 결과 : 한글 + JSON
      // 1) utf-8을 기준으로 디코드 : 복구 <=> 인코드 : 압축
      var decodeRes = utf8.decode(response.bodyBytes);
      // 2) content-type application/json
      var jsonRes = jsonDecode(decodeRes);
      print("Response body :");
      for (int i = 0; i < List.from(jsonRes).length; i++) {
        print('$i : ${jsonRes[i]}');
      }
    } else {
      // 통신 싫패
      print("AJXA FAIL");
      print("Response body : ${response.body}");
    }
  }

  void _boardInfo(int no) async {
    // 단건조회 get http://192.168.0.11:8099/boardInfo?no=2

    // 1) 경로
    var url = Uri.parse('http://192.168.0.11:8099/boardInfo?no=$no');

    // 2) AJAX
    //var response = await http.get(url);
    http.get(url).then((response) {
      // 3) 응답처리
      if (response.statusCode == 200) {
        //서버에서 응답하는 결과 : 한글 + JSON
        // 1) utf-8을 기준으로 디코드 : 복구 <=> 인코드 : 압축
        var decodeRes = utf8.decode(response.bodyBytes);
        // 2) content-type application/json
        var jsonRes = jsonDecode(decodeRes);
        print("Response body :${jsonRes}");
      } else {
        // 통신 싫패
        print("AJXA FAIL");
        print("Response body : ${response.body}");
      }
    }).catchError((err) => print(err));
  }

  void _boardInsert() async {
    // post http://192.168.0.11:8099/boardInsert
    // content type : application/x-www-formurlencoded
    var url = Uri.parse('http://192.168.0.11:8099/boardInsert');

    var response = await http.post(
      url,
      body: {
        'title': 'Add Board',
        'writer': 'tester',
        'content': 'no coment',
        'regDate': '2025-01-23',
      },
    );

    if (response.statusCode == 200) {
      // ust-8 기반 decode 생략
      // json 변환
      var jsonRes = jsonDecode(response.body);
      print('Response Body $jsonRes');
    } else {
      print("AJXA FAIL : ${response.body}");
    }
  }

  void _boardUpdate() async {
    var url = Uri.parse('http://192.168.0.11:8099/boardUpdate');

    // content type : application/json
    // 1. header 에 content-type : application/json 설정
    // 2. 보낼 데이터를 json 으로 변경
    var response = await http.post(
      url,
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        "no": 11,
        "title": "수정",
        "writer": "수정",
        "content": "새로은 하루가 시작되네요.",
        "regDate": "2000-08-09",
        "updDate": "2025-01-23",
      }),
    );

    if (response.statusCode == 200) {
      var decodeRes = utf8.decode(response.bodyBytes);
      // 2) content-type application/json
      var jsonRes = jsonDecode(decodeRes);
      print('Response Body $jsonRes');
    } else {
      print("AJXA FAIL : ${response.body}");
    }
  }

  void _boardDel(int no) async {
    var url = Uri.parse('http://192.168.0.11:8099/boardDelete?no=$no');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        var decodeRes = utf8.decode(response.bodyBytes);
        var jsonRes = jsonDecode(decodeRes);
        print("Response body :$jsonRes");
      } else {
        print("AJXA FAIL : ${response.body}");
      }
    }).catchError((err) => print(err));
  }
}
