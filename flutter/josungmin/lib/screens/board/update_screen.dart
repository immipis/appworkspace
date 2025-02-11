import 'package:flutter/material.dart';
import 'package:josungmin/apis/boardAPI.dart';
import 'package:josungmin/models/board.dart';

class UpdateScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  @override
  State<UpdateScreen> createState() => _updateScreenState();
}

class _updateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  late int no;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      no = arguments as int;
      widget.bdServer.selectBorad(no).then((result) {
        _titleController.text = result.memoTitle!;
        _contentController.text = result.memoContent!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo Update'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.no_accounts),
              title: Text("$no"),
            ),
            TextFormField(
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
                }
                ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _updateBoard();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(),
            ),
            child: Text('수정하기'),
          ),
        ),
      ),
    );
  }

  Future<void> _updateBoard() async {
    if (_formKey.currentState!.validate()) {
      BoardVO board = BoardVO(
        memoNo: no,
        memoTitle: _titleController.text,
        memoContent: _contentController.text,
      );
      int result = await widget.bdServer.updateBoard(board);
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Update Success"),
          backgroundColor: Colors.blueAccent,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("게시글 수정 실패"),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }
}
