abstract class Person {
  String? name;

  Person(this.name);

  study() {
    print('People ate studying');
  }

  work(); // 추상 메서드 : 함수몸체가 없다
}

class Developer extends Person {
  //자식 클래스의 생성자를 호출하는 경우 부모의 생성자가 자동호줄
  //자식 클래스 내부에서 부모 클래스의 멤버에 접근할때 super 키워드를 사용
  Developer(String name) : super(name);

  //부모의 일반메서드는 선택적으로 오버 라이딩 가능
  // =>이경우 반드시 자식 메서드만 호출

  @override //메소드 오버라이딩 하는순간 부모의 메서드는 덮어진다 외부에서 부모 메서드 접근 불가
  study() {
    // TODO: implement ==
    print('developer are studing');
  }

  @override
  work() {
    print('developer are developing');
  }
}
