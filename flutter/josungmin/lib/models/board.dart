
class BoardVO {
  int? memoNo;
  String? memoTitle;
  String? memoWriter;
  String? memoContent;
  String? regDate;
  String? bookMark;
  

  BoardVO({
    this.memoNo,
    this.memoTitle,
    this.memoWriter,
    this.memoContent,
    this.regDate,
    this.bookMark,
  });

  Map<String, dynamic> toMap() {
    return {
      "memoNo": memoNo ?? '',
      "memoTitle": memoTitle ?? '',
      "memoWriter": memoWriter ?? '',
      "memoContent": memoContent ?? '',
      "regDate": regDate ?? '',
      "bookMark": bookMark ?? '0',
    };
  }
}
