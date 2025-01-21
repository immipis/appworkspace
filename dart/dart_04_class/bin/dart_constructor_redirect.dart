// redirect = 생성자 재호출

class Person {
  String? name;
  int? age;

  Person(this.name, this.age) {}

  Person.init(String name) : this(name, 20); //이름 없는 생성자 리다이렉팅

  Person.second(String name) : this.init(name); // 이름 있는 생성자 리다이렉팅

  showInfo() {
    return '$name , $age';
  }
}

void main(List<String> args) {
  Person person = Person("조", 20);
  print(person.showInfo()); //생성자 호출
  print(Person.init("조2").showInfo()); //이름 없는 생성자 호출
  print(Person.second("조3").showInfo()); //이름 있는 생성자 호출
}
