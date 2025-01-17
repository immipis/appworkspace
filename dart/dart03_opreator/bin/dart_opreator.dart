
void main(List<String> args) {
  // 몫구하는 연산 : ~/
  int num = 5;
  dynamic result = num /2; //결과
  print('/2 $result');
  result = num % 2;  // 나머지
  print('%2 $result');
  result = num ~/ 2; //몫
  print('~/ $result');

  // ~/= 몫구하고 바로 대입
  num ~/= 2;
  print('$num');

  print('=====================================================================================================================');
  
  // ??=
  String? msg = null;

  print(msg);

  msg ??= "Hello Bro";
  print(msg);

  //msg ??= "Today is ..."; //not null이라 작동안함
  //print(msg);
}