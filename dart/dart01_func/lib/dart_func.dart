// 일급객체
// 1) 변수가 함수를 참조 가능
// 2) 매개변수로 함수를 받기 가능
// 3) 함수의 결과로 또다른 함수를 반환

// ex1)
void welcomeMsg() {
  print('Hello, Bro!');
}

void firstMain() {
  // 변수에 함수를 대입
  var myFun = welcomeMsg;

  myFun();
  welcomeMsg();
}

// ex2)
void forEach(var callbackFun) {
  var list = ['a', 'b', 'c', 'd', 'e'];
  for (int i = 0; i < list.length; i++) {
    callbackFun(list[i], i);
  }
}

void secondMain() {
  String result = '';
  forEach((value, index) {
    print('$value, $index');
    result += value;
  });
  print('result : $result');
}

// ex3)

makeAddFunc(int init) {
  String msg = 'result';
  return (x) {
    return '$msg : ${init + x}';
  };
}

String thirdMain() {
  int initValue = 10;
  var resultFun = makeAddFunc(initValue);
  /*
    var resultFun =(x){
      return 'result : ${10 + x}'; //이렇게 리턴 받음
    }
  */
  return ('$initValue + 5 = ${resultFun(5)}');
  // 10 + 5 = result : 15
  // print('$initValue + 10 = ${resultFun(10)}');
  // 10 + 10 = result : 20
}
