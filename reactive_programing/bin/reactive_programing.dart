import 'package:reactive_programing/reactive_programing.dart' as reactive_programing;
import 'package:rxdart/rxdart.dart';


void main(List<String> arguments) {
  //demoPublishSubject();
  //demoBehaviorSubject();
  replaySubjectDemo();
  
  
}
// publish Subject
/*
Lấy 1 giá trị thêm vào trước thời điểm lấy và các giá trị thêm vào Stream sau thời điểm đặt listen (lấy);
*/
demoPublishSubject(){
  PublishSubject publishSubject = PublishSubject<int>();
  publishSubject.listen((value){
    print("Lấy dữ liệu lần 1: $value");
  });
  publishSubject.add(100);
  publishSubject.add(101);

  publishSubject.listen((value){
    print("Lấy dữ liệu lần 2: $value");
  });
  publishSubject.add(200);
  publishSubject.add(201);
}

// Behaviour Subject
/*
Chỉ lấy các giá trị thêm vào Stream sau thời điểm đặt listen (lấy);
*/
demoBehaviorSubject(){
  BehaviorSubject behaviorSubject = BehaviorSubject<int>();
  behaviorSubject.listen((value){
    print("Lấy dữ liệu lần 1: $value");
  });
  behaviorSubject.add(100);
  behaviorSubject.add(101);

  behaviorSubject.listen((value){
    print("Lấy dữ liệu lần 2: $value");
  });
  behaviorSubject.add(200);
  behaviorSubject.add(201);
}

// ReplaySubject Subject
/*
Có bao nhiêu lấy hết 
*/
replaySubjectDemo(){
  ReplaySubject replaySubject = ReplaySubject<int>();
  replaySubject.listen((value){
    print("Lấy dữ liệu lần 1: $value");
  });
  replaySubject.add(100);
  replaySubject.add(101);

  replaySubject.listen((value){
    print("Lấy dữ liệu lần 2: $value");
  });
  replaySubject.add(200);
  replaySubject.add(201);
}