/* 
  숫자 : num -> 정수 : int / 실수 : double
  문자열 : String, 유니코드 값 : Rune
  논리 : bool
  Null
*/

void printVariable() {
  num numVal = 10;
  int intVal = 100;
  double dobVal = 12.0;

  // 상속관계를 통한 자식 객체가 부모 객체로 타입변환
  numVal = intVal; // int => num
  numVal = dobVal; // int => double

  print(numVal);
  // intVal = dobVal; // double => int
  // dobVal = intVal; // int => double
}

/* 
  컬렉션 : 변수가 여러개의 값을 가지는 경우
  List - 인덱스로 값을 구분, 값의 중복 허용
  Set  - 식별자 역할이 없음, 값의 중복 불가
  Map  - 키와 값을 한쌍으로 저장, 키는 중복이 불가하니 값은 중복 허용
*/

void printcollection() {
  List<int> intList = [1, 1, 2, 2, 3];
  print(intList[0]);
  print(intList[2]);

  Set<int> intSet = {1, 2, 5};
  print(intSet.contains(2)); // 값이 존재하는지 확인
  var list = intSet.toList();
  print(list);

  Map<String, dynamic> map = {'name': 'Hong', 'age': 20};
  print(map);
  // print(map.name) // 불가
}

void typeInterrence() {
  //타입추론 : 값을 기준심아 역으로 타입일 설정
  // var first = 1; //초기화 후에 타입이 변경 불가능
  // first = 'Hello';

  dynamic second = 1; //초기화 후에도 타입 // 변경 가능
  print('1 : ${second is int}');
  second = 'Hello';
  print('2 : ${second is String}');
  second = true;
  print('3 : ${second is bool}');
}
/* 
  값을 감는 변수의 구분 : 변수 or 상수
    1) 초기화 후에도 값이 변경될 수 있는 경우 : 변수
    2) 초기화 이후 값이 변경되지 않는 경우 : 상수
  -> 리터널 : 실제 값 그자체  
*/
void printConstant(){
  /* 
    dart의 상수 선언 방식 : final or const
    final 타입(생략가능 생략시 dynamic으로 선언 var는 안됨) 변수명 = 초기값;
    const 타입 변수명 = 초기값;
    => 타입은 생략가능 , 생략 시 dynamic 으로 선언
    => var은 함께 사용불가
  */
  var val = 10;
  final finalVal = (1+val);
  const constVal = (1+10);//(1+val) 안댐 컴파일시 리터럴 값을 가져야함 그니깐 실행하기 전에 값을 가져야댐
}