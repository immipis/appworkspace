Future<String> getData(var no) {
  return Future(() {
    //비동기 작업을 정의할 함수가 필요 비동기 작업 => 콜백함수
    for (int i = 0; i < 10000000000; i++) {
      // 해당작업의 결과 반환
    }
    return '$no completed';
  });
}

void firstMain() {
  print('start');
  getData(1).then((data) {
    print(data);
    getData(2).then((data) {
      print(data);
      getData(3).then((data) {
        print(data);
      });
    });
  }).catchError(print);

  print('end');
}


void futureTest(var no) async{
  print('$no start');

  var first = await getData(1);
  print('$no first result : $first');

  var second = await getData(2);
  print('$no second result : $second');

  var third = await getData(3);
  print('$no third result : $third');

  print('$no do something');
}


void main(List<String> args) {
  firstMain();
  futureTest(3);
  futureTest(5);
}