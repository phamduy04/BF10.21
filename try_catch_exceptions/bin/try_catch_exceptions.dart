
import 'dart:ffi';

import 'package:test/expect.dart';
import 'package:try_catch_exceptions/try_catch_exceptions.dart' as try_catch_exceptions;

void main(List<String> arguments) {
  var input = 'Hello';
  // try ... catch 
  /*
  try{
  int result = int.parse(input);
  } catch (e){
    print(e.toString());
  }
  

  // try .on. catch 
 
  try{
  int result = int.parse(input);
  } on FormatException{
    print("Đây là lỗi format");
  } 
  catch (e){
    print(e.toString());
  }
  

  // try ... catch...finally 
  try{
  int result = int.parse(input);
  } catch (e){
    print(e.toString());
  } finally {
    print ("Thực hiện lệnh trong Finally") ;
  }
 

  try{
  int result = int.parse(input);
  }
  finally {
    print ("Thực hiện lệnh trong Finally") ;
  }
  */

  // throw Exception 
  //checkAge(age: -5);
  try{
    checkAge(age: -5);
  }
  catch(e){
    print(e.toString());
  }

  //int result = int.parse(input);
  print("Chương trình kết thúc") ;

}
// throw Exception 

void checkAge({required int age})
{
  if(age< 0 ) { 
    throw Exception("Tuổi không được âm");
    }
    else if(age < 30 ) print("Bạn vẫn trẻ");
    else if(age < 80) print("Bạn đã trưởng thành");
    else print("Bạn sống quá thọ");
}
