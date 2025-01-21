import 'package:dart_04_class/dart_getter&setter.dart';


void main(List<String> args) {
  Person person = Person("Kim");
  print(person.name);
  print(person.age);

  // person.name("hong"); //세터가 없어 변경불가
  person.age = -10;
  print(person.age);
  person.age = 20;
  print(person.age);

}