main(){
  ThreeKingdoms threeKingdoms = ThreeKingdoms();
  print(threeKingdoms.name);
  threeKingdoms.sayName();

  ThreeKingdoms2 threeKingdoms2 = ThreeKingdoms2('유비', '촉');
  threeKingdoms2.saySomething();

} // main

class ThreeKingdoms{
  // Field
  String name = '유비';

  // Constructor


  // Method or Function
  sayName(){
    print("내 이름은 ${this.name} 입니다."); // this 는 Field에 있는 변수값.
  }
}

class ThreeKingdoms2{
  // Field 
  late String name; // late 지금은 없으나 조금 이따 초기화할게 
  String? nation; // 널 가능 선언

  // Constructor
    ThreeKingdoms2(String name,String nation)
    : this.name = name,
      this.nation = nation;

  // Method
  saySomething(){
    print("제 이름은 ${this.name}이고 조국은 ${this.nation} 입니다.");
  }

}