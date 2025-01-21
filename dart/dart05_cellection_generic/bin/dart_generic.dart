class Person {
  eat() {
    print('Person eat');
  }
}

class Student extends Person {
  @override
  eat() {
    print('Student eat');
  }
}

class Dog {
  eat() {
    print('Dog eat');
  }
}

class Manager<T> {
  T _target;

  Manager(this._target);

  T get target => _target;

  set target(T target) {
    this._target = target;
  }

  void showInfo() {
    print('Instance of $T');
  }
}

void main(List<String> args) {
  var mng1 = Manager<Person>(Person());
  print(mng1);
  if (mng1.target is Person) {
    print('target 의 데이터 타입은 person 입니다');
  } else {
    print('target 의 데이터 타입은 person 이 아닙니다');
  }

  //mng1.target = Dog(); //제네릭 타입으로 생성시 그타입 이외의 타입은 못들어감
  mng1.target = Student();
  mng1.target.eat();

  var mng2 = Manager<Dog>(Dog());
  mng2.target.eat();
}
