class Person {
  String _name;
  int _age;
  Person(this._name) : _age = 00 {}

  String get name => this._name;

  int get age {
    return this._age;
  }

  void set age(int age) {
    this._age = age >= 0 ? age : 0;
  }
}
