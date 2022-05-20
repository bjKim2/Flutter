main(){
  checkVersion();
  print('End process');
}

//비동기 함수 Future
Future checkVersion() async{
  var version = await lookupVersion();
  print(version);
}

int lookupVersion(){
  return 12;
}