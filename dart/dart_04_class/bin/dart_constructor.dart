import 'package:dart_04_class/dart_constuctor_default.dart';

void main(List<String> args) {
  Person person =  Person();
  print('person : ${person.getName()}');

  Student first = Student("예담",3, "hong");
  first.showInfo();

  Student second = Student.isEmpty();
  second.showInfo();
}