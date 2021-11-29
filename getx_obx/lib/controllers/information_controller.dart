import 'package:get/get.dart';

// Obx  : Observer + RxDart
// RxString rxString => String : rxString.value;
//String  string => RxString ; string.obs ;

class InformationController extends GetxController{

  // RxString, RxInt, Rx...
  // RxString = String.obs
  // String = RxString.value;
  var userName = " ".obs;
  var  age = " ".obs ;

  updateInformation({required String userName, required String age}){
    this.userName = userName.obs;
    this.age = age.obs;
  }

}