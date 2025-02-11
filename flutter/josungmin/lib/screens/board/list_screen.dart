import 'package:flutter/material.dart';
import 'package:josungmin/apis/boardAPI.dart';
import 'package:josungmin/models/board.dart';

class ListScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<BoardVO> _boardList = [];
  @override
  void initState() {
    super.initState();
    widget.bdServer.selectBorads().then((result) {
      setState(() {
        _boardList = result;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Notepad'),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/board/book',
                  );
                },
                icon: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ))
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: ListView.builder(
          itemCount: _boardList.length,
          itemBuilder: (context, index) {
            BoardVO boardInfo = _boardList[index];
            // ignore: avoid_print
            return ListTile(
              leading: IconButton(
                  onPressed: () {
                    _bookUpdate(boardInfo.memoNo!,
                        boardInfo.bookMark == '1' ? '0' : '1');
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/board/list', (route) => false);
                  },
                  icon: Icon(
                    Icons.star,
                    color:
                        boardInfo.bookMark == '1' ? Colors.yellow : Colors.grey,
                  )),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(boardInfo.memoTitle!),
                  Text(boardInfo.memoNo.toString())
                ],
              ),
              trailing: IconButton(
                  onPressed: () async {
                    bool check = await showDeleteConfirmDialog(context);
                    if (check) {
                      widget.bdServer
                          .delBoard(boardInfo.memoNo!)
                          .then((result) {
                        if (result > 0) {
                          setState(() {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/board/list', (route) => false);
                          });
                        }
                      });
                    }
                  },
                  icon: Icon(Icons.delete)),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/board/read",
                  arguments: boardInfo.memoNo,
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //게시글 등록 페이지 연결
          Navigator.pushNamed(
            context,
            '/board/insert',
          );
        },
        child: Icon(Icons.create),
      ),
    );
  }

  Future<void> _bookUpdate(int no, String book) async {
    BoardVO board = BoardVO(memoNo: no, bookMark: book);
    await widget.bdServer.changeBookMark(board);
  }
}

//삭제 확인 다이얼 로그
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
