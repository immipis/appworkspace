// 지정한 패키지 내의 라이브러리를 사용하고자 할때 import
import 'package:dart_ex01/dart_ex01.dart' as dart_ex01;
// as 변수명 : 선택사항 => 해당 라이브러리를 변수에 담음

//함수선언
add(int a, int b) {
  return a + b;
}

main() {
  // **앱 실행을 시작하는 최상위 함수
  print('1번 ${dart_ex01.getnum()}'); // 표현식을 출력할 경우 '내용 ${표현식}'

  var numberA = 10; //타입 추론
  int numberB = 25; //타입 명시
  int result = add(numberA, numberB); // 함수 호출
  dart_ex01.printResult(result); // dart_ex01.dart 내의 printResult() 함수를 호출
  print('종료 ㅂㅂ');
}
