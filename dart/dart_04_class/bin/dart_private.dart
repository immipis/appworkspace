import 'package:dart_04_class/dart_private.dart';

void main() {
  Person person = Person('Kim', 20);
  print('name : ${person.name}');
  // print('age : ${person._age}');

  print('getAge : ${person.getAge()}');
  // print('msg : ${person._getMsg()}');

  person.showInfo();
}
