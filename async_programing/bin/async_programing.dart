import 'package:async_programing/async_programing.dart' as async_programing;
import 'package:test/scaffolding.dart';

void main(List<String> arguments) async {
  /*
  // async...await 
  var number = await makeLateNumber();
  print(number.toString());
  */
  makeLateNumber().then((value) {
    print(value.toString());
  });

  // Tạo Stream và lấy dữ liệu trong Stream 
  //Stream<int> numberStream = Stream<int>.periodic(Duration(seconds: 2), makeNumber );
  /*
  numberStream.listen((number) { 
    print("Số lấy từ Number stream là: $number");
  });
  */
  //printNumberfromNumberStream(numberStream);


  print("Chương trình kết thúc");

  // Tạo Stream bằng từ khoá : yield, async*  
Stream<int> nunberStreamFromYield = numberStreamByYieldAsyncStar(10); 
printNumberfromNumberStream(nunberStreamFromYield) ;

}
// dữ liệu dạng Future gọi là dữ liệu bất đồng bộ 
Future<int> makeLateNumber(){
  return Future.delayed(
    (Duration(seconds: 2)),
    (){return 5;}
  );
}



// print Number from Stream 





Stream<int> numberStreamByYieldAsyncStar( int? max)async* {

  for(int i = 1; i<= max! ; i++)
    yield i;
  
}

printNumberfromNumberStream(Stream<int> stream)async{
  await for (int number in stream)
  {
    print("Số lấy từ Number stream là: $number");
  }
}

// tạo số 
int makeNumber(int value)=> value + 1; 





