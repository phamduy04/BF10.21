

import 'package:test/test.dart';

int birthYear = 1991; 
void main(List<String> arguments) {
  int number = 10 ;
  print(number.toString()) ;
  print("Số trên là: $number");
  // String, double, bool , 
  String name = "Báo Flutter";
  print(name);
  bool isChecked = false; 
  if(isChecked) print("Đã check");
  else print("Chưa check") ;
  DateTime date = DateTime.now();
  print(date.toString()) ;

  // Null Safety 
  String? address; // Dart SDK " < 2.12  Chưa Null safety : null , address = null
  print(address); // Dart SDK " >= 2.12 ; đã áp dụng Null Safety", nghĩa là : address nó ko tự gán là null 
  //String mainAddress = address! + "Street" ; 
  int number1 = 5; 
  int number2 = 10; 

  int sum = tinhTong(5, 10);
  print(sum.toString());
  int hieu = tinhHieu(soBiTru: number2, soTru: number1);
  print(hieu.toString()) ;

  var number3 = 10 ; 
  var trueName = "Nam" ;
  var isLogined = true; 

  // number3 = "Hello" ; Error 
  number3 = 6; 

  final number4 = 15; 
  const dynamic AGE = 30; 

  dynamic phoneNumber = "02395253543" ;

  //number4 = "hello" ;

  if(checkSoChan(number: number4)) print("Số $number4 này là số chẵn") ;
  else print("số $number4 này là số lẻ") ;

  int number5 =  3;  
  number5 += 3; // number5 = number5 + 3 ;
  // && : * ; true = 1; false = 0 ;  true && false = 1 * 0 = 0 false ;  
  // || : + ; true = 1; false = 0 ;  true || false = 1 ; true 

  bool result = (5>4)&&(2<1) ;
  print(result.toString());

  List<int> numberList = [4, 5, 8, 9, 10];
  // Có length : 5 ;      0, 1, 2, 3, 4 

  for(int number in numberList)
  {
    if(number%2==0 ) print("Số chẵn: $number") ;
  }

  for(int i = 0 ; i< numberList.length ; i++ ) // i ++ ; i = i+ 1; 
  {
    if(numberList[i]%2!=0 ) print("Số lẽ: " + numberList[i].toString()) ;
  }

  tinhGiaiThua(inputNumber: 3);

  Map<String, int> exMap = Map<String, int >();
  exMap = {
    "age" : 30, 
    "birth_year" : 1991, 


  };
  Map exMap2 = {
    "name": "Báo Flutter",
    "phone_number": "043445455"
  };

  print(exMap2['phone_number']) ;
  
}

void tinhGiaiThua({required int inputNumber}){
  int originalNumber = inputNumber;
  int result = 1; 
  /*
  while(inputNumber>0)
  {
    result *= inputNumber; 
    inputNumber --; 
  }
  */


  do{
    result *= inputNumber; 
    inputNumber --; 
  }while(inputNumber>0) ;
  

  print ("Kết quả tính giai thừa của $originalNumber là: $result" ) ;

}



// khi kiểu dữ liệu là dynamic thì có thể bỏ từ dyamic đi ; 
tinhTich ({ required soHang1, required  soHang2})
{
  return soHang1*soHang2 ;
}

int tinhTong(int a, int b ){
  int c = 0 ;
  return a+b; 

} 

int tinhHieu({ required int soBiTru, required int soTru } ){
  
  return soBiTru - soTru; 

} 

bool checkSoChan({required int number}){
   if(number%2 == 0) return true;
   return false; 
}

void  checkSoChanLe({ required int number }){
  int soDu = number%2; 

 switch (soDu) {
   case 0: 
   print("Số này là số chẵn");
   break;

   case 1: 
   print("Số này là số chẵn");
   break;
     
   default:
   print("Không thực hiện gì");
   break;
 }

}


