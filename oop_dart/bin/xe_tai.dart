import 'xe.dart';
import 'xe_ve_sinh.dart';

class XeTai extends Xe  { // Kế thừa từ lớp Xe: dùng được hết thuộc tính, phương thức public của X

  XeTai({brand, productYear}):super(brand: brand, productYear: productYear);
  // super : nhảy về lớp cha và thực thi
  @override
  chuyenCho() {
    // TODO: implement chuyenCho
    //return super.chuyenCho();
    print("Chuyên chở vật liệu xây dựng");
  }

  @override
  getVehicleAge() {
    // TODO: implement getVehicleAge
    return DateTime.now().year - super.productYear! + 5;
  }




}