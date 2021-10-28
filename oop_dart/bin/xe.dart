class Xe {

  String? brand; 
  int? productYear; 

  Xe({this.brand, this.productYear});

  chuyenCho(){
    print("Xe dùng để chở bất cứ thứ gì");
  }
  getVehicleAge(){
    return DateTime.now().year - this.productYear! ;
  }
 

}