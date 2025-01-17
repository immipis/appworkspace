class Person {
  //필드
  String name = 'person';
  //생성자
  int age = 18;
  //메소드
}

class Employee extends Person {
  String name = 'Employee';
  int age = 25;
}

class Student extends Person {
  String name = 'Student';
}

void main(List<String> args) {
  Employee emp = new Employee();
  Student std = Student();

  //타입변한
  // 1) 자식 -> 부모
  Person first = emp as Person; //emp를 person 으로 바꿔서 넘김
  Person second = std; //자식이 부모로 변하는 경우에는 as 안써도됨

  // 타입검사 맞는지 = is
  if (first is Person) {
    print('emp to person');
  } else {
    print('emp to person fall');
  }

  // 타입검사 맞지 않는지 = is!
  if (first is! Person) {
    print('emp to person fall');
  } else {
    print('emp to person');
  }

  //타입변한
  // 2) 부모 -> 자식 기본적으로 막힘 이유는 부모의 +a 가 자식이기 때문에 자식이 부모로 바꼈다가 다시 자식으로 바뀌는 타입 변환
  Employee castEmp = first as Employee;
  Student castStd = second as Student;

  print('emp : ${castEmp.name}');
  print('std : ${castStd.name}');
}
