class Employee {
  String? name;
}

//1) 조건적 맴버 접근 : ?
void fieldMain() {
  Employee emp = Employee();
  // emp.name ='Employee';

  var result = emp?.name; //emp가 null 이 아닐경우 emp의 name 값을 가져온다
  print(result);

  if (emp != null) {
    result = emp.name;
  } else {
    result = null;
  }
  print(result);
}

// 2) 널 확인 연산자 : ??
void nullChikMain() {
  Employee emp = Employee();

  var result = emp.name ?? 'no employee';
  emp.name ??= 'no employee';

  print(result);
  print(emp.name);
}

void main(List<String> args) {
  nullChikMain();
}
