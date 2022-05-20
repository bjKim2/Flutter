main(){
  // Function
  List<int> list1 = [1,3,5,7,9];
  int sum = 0;
  for(int i in list1){
    sum += i;
  }
  print("합계 : $sum");

  List<int> list2 = [10,30,50,70,90];
  int sum2 = 0;
  for(int i in list2){
    sum2 += i;
  }
  print("합계 : $sum2");


  _addList(List list){
    int sum = 0;
    for(int i in list){
      sum += i;
    }
    print("합계 : $sum");
  }// 변수나 함수 이름 앞에 _ (언더바)는 private이고 안쓰면 public 이다. 

  _addList(list1);
  _addList(list2);

  int _addList2(List list){
    int sum = 0;
    for(int i in list){
      sum += i;
    }
    
    return sum;
  }// 변수나 함수 이름 앞에 _ (언더바)는 private이고 안쓰면 public 이다. 

  int result = _addList2(list1);
  print(result);
  
}

