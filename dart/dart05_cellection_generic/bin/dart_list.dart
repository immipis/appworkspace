void main() {
  List<String> colors = ['red', 'blue', 'green'];
  print(colors.first);
  print(colors.length);

  for (int i = 0; i < colors.length; i++) {
    print('$i : ${colors[i]}');
  }
  var colorsList = <String>[];
  print(colorsList.isEmpty);
  colorsList.add('skyBlue');
  colorsList.add('green');
  colorsList.addAll(['white', 'yellow']);

  colorsList.forEach((value) => print(value));
  colorsList.forEach(print);
}
