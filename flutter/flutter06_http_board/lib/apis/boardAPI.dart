import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:flutter06_http_board/models/board.dart';

class BoardServer {
  //필드 => url 정보들
  final String origin = 'http://192.168.0.11:8099';
  final String selectAll = '/boardList';
  final String selectOneByNo = '/boardInfo?no=';
  final String insertOne = '/boardInsert';
  final String updateOne = '/boardUpdate';
  final String deleteOneByNo = '/boardDelete?no=';
  // 메서드
  // 전체조회
  Future<List<BoardVO>> selectBorads() async {
    // 1) 경로
    String selected = origin + selectAll;
    var url = Uri.parse(selected);
    // 2) 아작스
    http.Response result = await http.get(url);
    // 3) 후속처리
    if (result.statusCode == HttpStatus.ok) {
      // 1) 응답 데이터에 한글이 존재한은 경우 utf8을 이용해서 디코드
      final decodeRes = utf8.decode(result.bodyBytes);
      // 2) applicatiom/json : jsonDecode()
      // final List<Map<String, String>> jsonRes = jsonDecode(decodeRes);
      final List<dynamic> jsonRes = jsonDecode(decodeRes);

      List<BoardVO> boardList = List.generate(jsonRes.length, (index) {
        // Map<String, dynamic> map = jsonRes[index];
        dynamic map = jsonRes[index];
        BoardVO board = BoardVO(
          no: map['no'],
          title: map['title'],
          writer: map['writer'],
          content: map['content'],
          regDate: map['regDate'],
          updDate: map['updDate'],
        );
        return board;
      });
      return boardList;
    } else {
      print('list fail : ${result.body}');
      //future<T> : T, Futer의 결과가 가지는 데이터 타입
      return [];
    }
  }

  // 단건조회
  Future<BoardVO> selectBorad(int no) async {
    String selected = origin + selectOneByNo + no.toString();
    var url = Uri.parse(selected);

    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final String decodeRes = utf8.decode(result.bodyBytes);
      final dynamic jsonRes = jsonDecode(decodeRes);
      return BoardVO(
        no: jsonRes['no'],
        title: jsonRes['title'],
        writer: jsonRes['writer'],
        content: jsonRes['content'],
        regDate: jsonRes['regDate'],
        updDate: jsonRes['updDate'],
      );
    } else {
      print('info : ${result.body}');
      return BoardVO.empty();
    }
  }

  Future<int> insertBoard(BoardVO board) async {
    String selected = origin + insertOne;
    var url = Uri.parse(selected);

    // Post, contentType : application/x-www/form/url => mapmap <str,str> 타입
    Map<String, dynamic> info = board.toMap();
    http.Response result = await http.post(url, body: info);

    if (result.statusCode == HttpStatus.ok) {
      final decodeRes = utf8.decode(result.bodyBytes);
      final boardInfo = jsonDecode(decodeRes);

      return boardInfo['no'];
    } else {
      print('Insert Fail : ${result.body}');
      return 0;
    }
  }

  Future<int> updateBoard(BoardVO board) async {
    String selected = origin + updateOne;
    var url = Uri.parse(selected);

    // Post, contentType : application/x-www/form/url => mapmap <str,str> 타입
    Map<String, dynamic> info = board.toMap();
    http.Response result = await http.post(url,
        headers: {'content-type': 'application/json'}, body: jsonEncode(info));

    if (result.statusCode == HttpStatus.ok) {
      final decodeRes = utf8.decode(result.bodyBytes);
      final boardInfo = jsonDecode(decodeRes);

      return boardInfo['no'];
    } else {
      print('Insert Fail : ${result.body}');
      return 0;
    }
  }

  Future<int> delBoard(int no) async {
    String selected = origin + deleteOneByNo + no.toString();
    var url = Uri.parse(selected);
    http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final dynamic jsonRes = jsonDecode(result.body);
      return jsonRes['no'];
    } else {
      print('del fail : ${result.body}');
      return 0;
    }
  }
}
