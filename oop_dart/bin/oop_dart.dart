import 'package:oop_dart/oop_dart.dart' as oop_dart;
import 'hinh_vuong.dart';
import 'user.dart';
import 'xe_tai.dart';

void main(List<String> arguments) {
  // Tạo các đối tượng ( instance ) 
  /*
  User bao = User(); 
  User duy = User(); 
  User hai = User(); 
  User long = User(); 

  bao.userName ="Báo";
  bao.birthYear = 1991; 

  print("Tuổi là : " + bao.getAge().toString());
  */

  User bao = User(
    userId: 1,
    userName: "Bao",
    birthYear: 1991);

  print(bao.userName)  ;
  print( bao.userName.toString() + " có tuổi là : " + bao.getAge().toString());

  User duy = User(
    userId: 2,
    userName: "Duy",
    birthYear: 2000);

  User long = User(
    userId: 3,
    userName: "Long",
    birthYear: 1999);  

  List<User> userList = [bao, duy, long];
  findSmallestAgePerson(userList: userList);
  //
  bao.setPhoneNumber(phoneNumber: "0349582808");
  print(bao.getPhoneNumber());
 // 
 User.printKey();
 User.PI;
  //
const int USD_PRICE = 23000;

final int EURO_PRICE = USD_PRICE;

// 
XeTai xe = XeTai();
xe.brand = "Huyndai";
xe.productYear = 2004;
xe.chuyenCho();
print(xe.getVehicleAge().toString());

// tinh dien tich hv 
HinhVuong hinhVuong = HinhVuong(canh: 4);
print("Diện tích hình vuông  là: "+ hinhVuong.tinhDienTich().toString());
print("Chu vi hình vuông  là: "+ hinhVuong.tinhChuVi().toString());

}

void findSmallestAgePerson({ required List<User> userList}){
  int minAge = 150; 
  User? minSmallessAgePerson ;

  for(User user in userList )
  {
    if ( user.getAge()<= minAge ){
      minAge = user.getAge();
      minSmallessAgePerson = user;
    }
  }

  print("Người có tên là: " + minSmallessAgePerson!.userName.toString() + " có tuổi nhỏ nhất là $minAge" ) ;

}
