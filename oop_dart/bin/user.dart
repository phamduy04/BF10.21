class User {
  // thuộc tính 
  final int? userId; 
  String? userName; 
  int? birthYear;
  String? _phoneNumber; // private : chỉ được sử dụng trong Class không sử dụng hay gọi ra ở nơi khác class 

   
  // static , final, const 

 // static : 
 static double PI = 3.14;
 // hàm static 
 static void printKey()
{
  print("0i4353dskfjksdf");
}
// constants 




  // phương thức
  //User(); 
  // hàm khởi tạo  tạo ra một đối tượng ( hay instance);
 // User(); // hàm khởi tạo mặc định
 // User({this.userName, this.birthYear});
/*
 User({ String? userName, int? birthYear})
 {
   this.userName = userName;
   this.birthYear = birthYear;
 }
 */

User({ required this.userId, required this.userName, required this.birthYear});

// setter 
void setPhoneNumber({required String? phoneNumber}){
  this._phoneNumber = phoneNumber;
}
// getter 1
String getPhoneNumber() => this._phoneNumber! ;



// getter 2
String get phoneNumber => this._phoneNumber! ;

// => 10 ; <=> { return 10; }



  int getAge(){
    return DateTime.now().year - this.birthYear!;
  }

_showMoney() {
  return 2000000000 ;
}

  
}