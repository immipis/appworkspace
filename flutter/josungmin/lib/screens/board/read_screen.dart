import 'package:flutter/material.dart';
import 'package:josungmin/apis/boardAPI.dart';
import 'package:josungmin/models/board.dart';

class ReadScreen extends StatefulWidget {
  final BoardServer bdserver = BoardServer();

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  late int no;
  late Future<BoardVO> _board;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      no = arguments as int;
      _board = widget.bdserver.selectBorad(no);
    } else {
      no = 0;
      _board = Future.error("No board number provided");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo Content'),
        actions: [
          createPopMenu(no),
        ],
      ),
      body: FutureBuilder<BoardVO>(
        future: _board,
        builder: (conText, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No date found'),
            );
          } else {
            var board = snapshot.data!;
            return _boardContent(board);
          }
        },
      ),
    );
  }

  Widget _boardContent(BoardVO info) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  _bookUpdate(info.memoNo!, info.bookMark == '1' ? '0' : '1');

                  Navigator.pushNamed(
                    context,
                    "/board/read",
                    arguments: info.memoNo,
                  );
                },
                icon: Icon(Icons.star,
                    color: info.bookMark == '1' ? Colors.yellow : Colors.grey),
              ),
              title: Text(info.memoTitle!),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            padding: EdgeInsets.all(12.0),
            width: double.infinity,
            height: 320.0,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Text(
                info.memoContent ?? 'no write content',
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createPopMenu(int boardNo) {
    return PopupMenuButton<String>(onSelected: (String value) async {
      switch (value) {
        case 'update':
          Navigator.pushNamed(context, '/board/update', arguments: boardNo);
          break;
        case 'delete':
          bool check = await showDeleteConfirmDialog(context);
          if (check) {
            widget.bdserver.delBoard(boardNo).then((result) {
              if (result > 0) {
                setState(() {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/board/list', (route) => false);
                });
              }
            });
          }
          break;
      }
    }, itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          value: 'update',
          child: Row(
            children: [
              Icon(Icons.edit, color: Colors.black),
              SizedBox(
                width: 8,
              ),
              Text("수정하기")
            ],
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete, color: Colors.black),
              SizedBox(
                width: 8,
              ),
              Text("삭제하기")
            ],
          ),
        ),
      ];
    });
  }

  Future<void> _bookUpdate(int no, String book) async {
    BoardVO board = BoardVO(memoNo: no, bookMark: book);
    await widget.bdserver.changeBookMark(board);
  }
}

Future<bool> showDeleteConfirmDialog(BuildContext context) async {
  bool result = false;
  await showDialog<bool>(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text('알림'),
        content: Text('정말로 삭제 하시겟습니까?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('삭제'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('취소'),
          ),
        ],
      );
    },
  ).then(
    (value) {
      result = value ?? false;
    },
  );
  return result;
}
