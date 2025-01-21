void main(List<String> args) {
  Map<int, String> testMap = {1: 'red', 2: 'orange', 3: 'yellow', 4: 'red'};
  // Map이 보유한 값의 실제 타입 : MapEntry<key, value>
  // Map.length = MapEntry의 갯수
  print(testMap.length);
  for (var key in testMap.keys) {
    //Dart의 순환 for 문
    print('$key, ${testMap[key]}');
  }

  var maps = <String, int>{};

  maps['Reds'] = 1;
  maps['Orenge'] = 2;
  maps['Yellow'] = 3;

  //기존에 데이터를 수정하든 새로운 데이터를 등록하든 동일한 value
  maps['Black'] = 10;

  //기존에 데이터를 수정할 떄와 새로운 데이터를 등록할 떄는 다른 value
  maps.update('Blue', (value) => 20, ifAbsent: () => 0);

  maps.forEach((key, value) {
    print('$key, $value');
  });
}
