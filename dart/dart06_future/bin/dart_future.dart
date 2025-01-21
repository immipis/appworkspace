void main(List<String> args) {
  print('start');

  Future<String> firstFuture = Future(() {
    //비동기 작업을 정의할 함수가 필요 비동기 작업 => 콜백함수
    for (int i = 0; i < 10000000000; i++) {}
    // 해당작업의 결과 반환
    //return 'I got lots of Data!';
    return throw Exception("싫패 데이터가 너무 많음");
  });

  // then 매서드 : Completed 상태일때 후속 작업을 등록
// Future 가 함수를 실행하는 주체
  firstFuture.then((data) {
    // 첫번쨰 매개 변수 : 콜백함수 => data 상태(성공)
    // 메개변수 result : 작업의 결과 , future<t>의 제네릭 타입

    print(data);
  }, onError: (error) {
    // onError , 이름이 있는 매개변수 : 콜백함수 => 애러상태(실패)
    // 매개변수 error : 작업중 발생한 에러
    print('error: $error');
  });
  print('end');
}
