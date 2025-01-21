
class Person{
  String? name;
  //생성자를 생략하는 경우에 한해 기본 생성자 자동 추가
  //Person(){}

  getName(){
    return this.name;
  }
}

class Student{
  String? school;
  int? grade;
  String? name;

  Student(String school,int grade,String name){
    this.school = school;
    this.grade = grade;
    this.name = name;
  }

  //생성자 오버로딩  x => 이름이 없는 생성자는 오직 하나
  // Student(){}

  //이름이 있는 생성자
  Student.isEmpty(){
    print('이름이 있는 생성자 호출');
  }
  void showInfo(){
    print('$school,$grade,$name');
  }
}