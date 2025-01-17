// 선택적 매개변수 -> 메서드 오버로딩 대처하는 dart의 방식
// 1) 이름 있는 매개변수 (named parameters)
void getAddress(String country,
    {String city = "서울특별시", required String gu, String? ro}) {
  String address = '$country, $city, $gu, $ro';
  print(address);
}

void nameParams() {
  getAddress('대한민국', gu: '종로구');
  getAddress('대한민국', city: '대구광역시', gu: '종로구');
  getAddress('대한민국', gu: '종로구', city: '대구광역시');
  getAddress('미국', city: 'LA', gu: '구', ro: "로");
}

// 2) 위치적 선택 매개변수 (optional positional parameters)

void getAdrs(String country, [String city = "서울특별시", String? ro]) {
  String address = '$country, $city, $ro';
  print(address);
}

void positionParams() {
  getAdrs('대한민국');
  getAdrs('대한민국', '중구', '대구광역시');
}

