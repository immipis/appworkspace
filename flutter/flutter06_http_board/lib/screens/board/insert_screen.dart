import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

class InsertScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  @override
  State<InsertScreen> createState() => _insertScreenState();
}

class _insertScreenState extends State<InsertScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 작성'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  //text필드도 가진특성
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: '제목',
                  ),
                  validator: (value) {
                    //text폼필드가 가진특성

                    if (value == null || value.isEmpty) {
                      return '제목을 입력하세요'; //리턴이 null이면 진행 아니면 스탑
                    }

                    return null; // 앞의 조건문이 전부 false일 경우 널 반환 널이 반환 대면 정상진행
                  },
                ),
                TextFormField(
                  //text필드도 가진특성
                  controller: _writerController,
                  decoration: InputDecoration(
                    labelText: '작성자',
                  ),
                  validator: (value) {
                    //text폼필드가 가진특성

                    if (value == null || value.isEmpty) {
                      return '작성자를 입력하세요'; //리턴이 null이면 진행 아니면 스탑
                    }

                    return null; // 앞의 조건문이 전부 false일 경우 널 반환 널이 반환 대면 정상진행
                  },
                ),
                TextFormField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: '내용',
                  ),
                  maxLines: 5, //한번에 보이고자 하는 최대 글수
                ),
              ],
            ),
          )),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _insert();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(),
            ),
            child: Text('등록하기'),
          ),
        ),
      ),
    );
  }

  Future<void> _insert() async {
    if (_formKey.currentState!.validate()) {
      // form위젯 안의 validate를 순차적으로 실행
      //현재 연결된 Form 위젯의 자식 FormField들이 유효한 값을 가진 경우
      // 1) 서버에 전송할 데이터 확인
      BoardVO board = BoardVO(
        title: _titleController.text,
        writer: _writerController.text,
        content: _contentController.text,
      );
      // 2) 아작스
      int result = await widget.bdServer.insertBoard(board);
      // 3) 후속처리
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("게시글 등록 성공"),
          backgroundColor: Colors.blueAccent,
        ));
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/board/read',
          ModalRoute.withName('/board/list'),
          arguments: result,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("게시글 등록실패"),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }
}
