import 'package:dart_04_class/dart_extends.dart';

void main(List<String> args) { 
  // Person person = Person("Hong"); 불가
  Developer developer =Developer("Kang");
  developer.work();
  developer.study();

  Person person = Developer("Hong");
  person.work();
  person.study();
}