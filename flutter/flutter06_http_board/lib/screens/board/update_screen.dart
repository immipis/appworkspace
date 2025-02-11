import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

class UpdateScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  @override
  State<UpdateScreen> createState() => _updateScreenState();
}

class _updateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  late int no;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      no = arguments as int;
      widget.bdServer.selectBorad(no).then((result){
        _titleController.text = result.title!;
        _writerController.text = result.writer!;
        _contentController.text = result.content!;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 수정'),
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
              controller: _writerController,
              decoration: InputDecoration(
                labelText: '작성자',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '작성자를 입력하세요';
                }
                return null;
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
        no: no,
        title: _titleController.text,
        writer: _writerController.text,
        content: _contentController.text,
      );
      int result = await widget.bdServer.updateBoard(board);
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("게시글 수정 성공"),
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
