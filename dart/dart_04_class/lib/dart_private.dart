class Person{
  String? name;
  int? _age;

  Person(this.name,this._age);

  getAge(){
    return this._age; 
  }

  _getMsg(){
    return 'Hello !';
  }

  showInfo(){
    print('${_getMsg()},My name is $name age is $_age');
  }
}