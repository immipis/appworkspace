class Employee{
  String name ='employee';
  int? age;

  setAge(int age){
    this.age = age;
  }
  showInfo(){
    print('$name in $age');
  }
}

void defaultMain(){
  Employee emp = Employee();
  emp.name = 'Hong';
  emp.setAge(25);
  emp.showInfo();
}
void cascadeMain(){
  Employee emp = Employee()..name='kang'..setAge(20)..showInfo();
  print(emp);
}

void main(List<String> args) {
  cascadeMain();
}