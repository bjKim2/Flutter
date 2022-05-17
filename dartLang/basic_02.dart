main(){
  List threeKingdoms = []; //제너릭 안쓰면 Dynamic 디폴트가 
  // 추가하기
  threeKingdoms.add("위");
  threeKingdoms.add("촉");
  threeKingdoms.add("오");

  print(threeKingdoms);
  print(threeKingdoms[0]);

  //수정하기
  threeKingdoms[0] = "We";
  print(threeKingdoms);
  //삭제하기

  threeKingdoms.removeAt(1);
  print(threeKingdoms);

  threeKingdoms.remove("We");

  print(threeKingdoms.length);

  threeKingdoms.add(1);
  print(threeKingdoms);

  List<String> threeKingdoms2 = [];
  // ----

  // Map : Key와 value로 이루어진 Collection

  Map fruits = {
    'apple' : '사과',
    'grape' :  '포도',
    'watermelon' : '수박',
  };
  // key 하나에 value를 리스트로 넣은 것이 json

  print(fruits['apple']);
  fruits['watermelon'] = '시원한 수박';

  fruits['banana'] = '바나나'; // Map 원소 추가 
  print(fruits);

  Map<String, int> fruitsPrice = {
    'apple' : 1000,
    'grape' : 2000,
    'watermelon' : 3000,
  };

  print(fruitsPrice['apple']);
  int applePrice = fruitsPrice['apple']!; // optional 변수 , Null safety  
  //int? 는 null 수용하는 변수이고 int 는 null수용안됨 이럴 떈 끝에 !를 붙여야함

  int numA = 10;
  int? numB = 100; // null 수용 변수 선언
  numB = null; // 이점으로는 java와 달리 실행할떄 null값으로 오류나지 않는다. 
  //flutter 는 1버전만 클래스 선언시 new를 씀
  

}