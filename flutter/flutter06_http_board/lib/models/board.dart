// vo
/* 
{
  "no": 10,
  "title": "새로은 글입니다.",
  "writer": "한가",
  "content": "새로은 하루가 시작되네요.",
  "regDate": null,
  "updDate": null
}
 */
//필드
import 'package:flutter/material.dart';

class BoardVO {
  int? no;
  String? title;
  String? writer;
  String? content;
  String? regDate;
  String? updDate;

  //생성자
  //이름이 있는 매개변수 => 일부는 값이 안들어 올 수 있다
  BoardVO({
    this.no,
    required this.title,
    required this.writer,
    this.content,
    this.regDate,
    this.updDate,
  });

  //   BoardVo.paramter({
  //       int? no,
  // required String? title,
  // required String? writer,
  // String? content,
  // DateTime? regDate,
  // DateTime? updDate,
  //   }){
  //   this.no,
  //   required this.title,
  //   required this.writer,
  //   this.content,
  //   this.regDate,
  //   this.updDate,
  // };
  BoardVO.empty() {}
  // 메서드
  Map<String, dynamic> toMap() {
    return {
      "no": no ?? '',
      "title": title,
      "writer": writer,
      "content": content ?? '',
      "regDate": regDate ?? '',
      "updDate": updDate ?? '',
    };
  }
}
