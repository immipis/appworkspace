import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

class ReadScreen extends StatefulWidget {
  final BoardServer bdserver = BoardServer();

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  late int no; //처음 값을 가지기 전까지만 null 을가지겟다
  late Future<BoardVO> _board;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 부모가 바뀔시 자신도 바뀜 모달라우터는 페이지가 열릴때 전달 되는 객체
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
        title: Text('게시글 조회'),
        actions: [
          createPopMenu(no),
        ],
      ),
      body: FutureBuilder<BoardVO>(
        // Future이 완료되기 전에도 화면을 렌더링 할 수 있도록
        future: _board,
        builder: (conText, snapshot) {
          // snapshot : Future의 상태와 결과 등을 가진 객체
          if (snapshot.connectionState == ConnectionState.waiting) {
            //ConnectionState : Future의 상태 none -> waiting/active -> done
            return const Center(child: CircularProgressIndicator());
            //CircularProgressIndicator : 앱 진행사항을 원형으로 나타내는 위젯
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
            //둥근 모서리 그림자 효과
            child: ListTile(
              leading: Icon(Icons.article),
              title: Text(info.title!),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Card(
            //둥근 모서리 그림자 효과
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(info.writer!),
            ),
          ),
          SizedBox(
            height: 10.0,
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
                info.content ?? 'no write content',
                softWrap: true, //자동 줄바꿈
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createPopMenu(int boardNo) {
    return PopupMenuButton<String>(onSelected: (String value) async{
      switch (value) {
        case 'update':
          Navigator.pushNamed(context, '/board/update', arguments: boardNo);
          break;
        case 'delete':
          bool check = await showDeleteConfirmDialog(context);
          if(check){
            widget.bdserver.delBoard(boardNo).then((result){
              if(result>0){
                Navigator.pop(context);
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
              //Navigator.pop(context);
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
