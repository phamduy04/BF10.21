class HinhChuNhat{

  double? chieuDai;
  double? chieuRong;  

  HinhChuNhat({this.chieuDai, this.chieuRong});


 double tinhChuVi(){
    return (this.chieuDai! + this.chieuRong! )*2; 
  }

 double tinhDienTich(){
   return this.chieuDai! * this.chieuRong!;
 } 
    

}