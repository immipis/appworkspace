import 'package:flutter/material.dart';
import 'package:josungmin/apis/boardAPI.dart';
import 'package:josungmin/models/board.dart';

class InsertScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  @override
  State<InsertScreen> createState() => _insertScreenState();
}

class _insertScreenState extends State<InsertScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo Write'),
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
                    if (value == null || value.isEmpty) {
                      return '제목을 입력하세요';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      labelText: '내용',
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '내용을 입력하세요';
                      }
                      return null;
                    }),
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
      BoardVO board = BoardVO(
        memoTitle: _titleController.text,
        memoContent: _contentController.text,
      );
      int result = await widget.bdServer.insertBoard(board);
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Insert Success"),
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
