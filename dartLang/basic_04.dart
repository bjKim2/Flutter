main(){
  int? num1 = null;
  print(num1);
  num1 ??= 8; // num1 이 null이면 8을 준다.
  print(num1);


  // 삼항 연산자
  bool isPublic = true;
  var visibility = isPublic ? 'public' : 'orivate';
  print(visibility);

  int sum = 0;

  for ( int i = 1 ; i <= 10 ; i++){
    sum += i;
  }

  print(sum);


  List<int> numList = [1,2,5,6,8];
  sum =0;
  for(int i in numList){
    sum+=i;
  }

  print(sum);

}