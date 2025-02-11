import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:josungmin/models/board.dart';

class BoardServer {
  //필드 => url 정보들
  final String origin = 'http://192.168.0.11:8099';
  final String selectAll = '/memoList';
  final String selectOneByNo = '/memoInfo?memoNo=';
  final String insertOne = '/memoInsert';
  final String updateOne = '/memoUpdate';
  final String deleteOneByNo = '/memoDelete?memoNo=';
  final String bookMarkSelect = '/memoList?bookMark=1';
  final String bookMarkCange = '/memoBookMark';

  Future<List<BoardVO>> selectBorads() async {
    // 1) 경로
    String selected = origin + selectAll;
    var url = Uri.parse(selected);
    http.Response result = await http.get(url);

    print(result);
    if (result.statusCode == HttpStatus.ok) {
      final decodeRes = utf8.decode(result.bodyBytes);
      final List<dynamic> jsonRes = jsonDecode(decodeRes);

      List<BoardVO> boardList = List.generate(jsonRes.length, (index) {
        dynamic map = jsonRes[index];
        BoardVO board = BoardVO(
          memoNo: map['memoNo'],
          memoTitle: map['memoTitle'],
          memoWriter: map['memoWriter'],
          memoContent: map['memoContent'],
          regDate: map['regDate'],
          bookMark: map['bookMark'],
        );
        return board;
      });
      return boardList;
    } else {
      print('list fail : ${result.body}');
      return [];
    }
  }

  Future<BoardVO> selectBorad(int memoNo) async {
    String selected = origin + selectOneByNo + memoNo.toString();
    var url = Uri.parse(selected);

    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final String decodeRes = utf8.decode(result.bodyBytes);
      final dynamic jsonRes = jsonDecode(decodeRes);
      return BoardVO(
        memoNo: jsonRes['memoNo'],
        memoTitle: jsonRes['memoTitle'],
        memoWriter: jsonRes['memoWriter'],
        memoContent: jsonRes['memoContent'],
        regDate: jsonRes['regDate'],
        bookMark: jsonRes['bookMark'],
      );
    } else {
      throw ("fail");
    }
  }

  Future<int> insertBoard(BoardVO board) async {
    String selected = origin + insertOne;
    var url = Uri.parse(selected);
    Map<dynamic, dynamic> info = board.toMap();

    http.Response result = await http.post(url, body: info);

    if (result.statusCode == HttpStatus.ok) {
      final decodeRes = utf8.decode(result.bodyBytes);
      final boardInfo = jsonDecode(decodeRes);

      return boardInfo['memoNo'];
    } else {
      print('Insert Fail : ${result.body}');
      return 0;
    }
  }

  Future<int> updateBoard(BoardVO board) async {
    String selected = origin + updateOne;
    var url = Uri.parse(selected);

    Map<String, dynamic> info = board.toMap();
    print(board.toMap());
    http.Response result = await http.post(url,
        headers: {'content-type': 'application/json'}, body: jsonEncode(info));

    if (result.statusCode == HttpStatus.ok) {
      final decodeRes = utf8.decode(result.bodyBytes);
      final boardInfo = jsonDecode(decodeRes);

      return boardInfo['memoNo'];
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
      return jsonRes['memoNo'];
    } else {
      print('del fail : ${result.body}');
      return 0;
    }
  }

  Future<List<BoardVO>> selectBookMark() async {
    // 1) 경로
    String selected = origin + bookMarkSelect;
    var url = Uri.parse(selected);
    http.Response result = await http.get(url);

    print(result);
    if (result.statusCode == HttpStatus.ok) {
      final decodeRes = utf8.decode(result.bodyBytes);
      final List<dynamic> jsonRes = jsonDecode(decodeRes);

      List<BoardVO> boardList = List.generate(jsonRes.length, (index) {
        dynamic map = jsonRes[index];
        BoardVO board = BoardVO(
          memoNo: map['memoNo'],
          memoTitle: map['memoTitle'],
          memoWriter: map['memoWriter'],
          memoContent: map['memoContent'],
          regDate: map['regDate'],
          bookMark: map['bookMark'],
        );
        return board;
      });
      return boardList;
    } else {
      print('list fail : ${result.body}');
      return [];
    }
  }

  Future<bool> changeBookMark(BoardVO board) async {
    String selected = origin + bookMarkCange;
    var url = Uri.parse(selected);
    Map<String, dynamic> info = board.toMap();
    print(board.toMap());
    http.Response result = await http.post(url,
        headers: {'content-type': 'application/json'}, body: jsonEncode(info));

    if (result.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }
}
