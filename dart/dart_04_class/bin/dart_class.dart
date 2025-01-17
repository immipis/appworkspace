
//클래스 정의

class Person{
  // 변수 => 필드
  String? name;
  
  //생성자를 자동 생성하지 않아도 기본 생성자 사용
  //생성자가 생략된 경우 컴파일 시 자동생성 기본 생성자(Default constructor)
  //Person() {} // 작성할 경우 클래스명과 동일하며 매개변수가 없음
  

  String getName(){
    return this.name ?? 'no person';
  }
}

void main(List<String> args) {
  //인스턴스(객체) 생성 => 실제 사용이 가능
  Person student = Person()..name='Kim';
  var teacher = Person();

  // student : 'kim' teacher : 'pack'
  teacher.name = 'Pack';

  print(student.getName());
  print(teacher.getName());
}