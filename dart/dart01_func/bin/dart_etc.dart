// 1) 익명함수 : 함수 표현식
var add = (int x, int y) {
  return x + y;
};
makeFuc(){
  return(int x, int y){
    return x+y;
  };
}
// 2) 람다식
add2(int x, int y) => x + y;
int addLambda(int x, int y) => x+y;
// 람다식 익명 (int x, int y) => x + y


void main(List<String> args) {
  var result =  makeFuc();

  print(result(3,2));
  print(addLambda(5,2));
}

