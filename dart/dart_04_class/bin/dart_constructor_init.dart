class Person {
  String? name;
  int? age;

  Person()
      : name = "Kim",
        age = 28 {
    print('defult');
    print('name : $name age : $age');
  }

  Person.init(String name) : age = 20 {
    print('named');
    print('name : ${this.name} age : $age');
    this.name = name;
  }

  showInfo() {
    print('name : $name ,age : $age');
  }
}

void main(List<String> args) {
  Person first = Person();
  first.showInfo();

  Person second = Person.init("Hong");
  second.showInfo();
}
