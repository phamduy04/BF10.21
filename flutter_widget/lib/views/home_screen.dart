import 'package:flutter/material.dart';
import 'package:flutter_widget/resources/widgets/common_widgets.dart';
import 'package:flutter_widget/views/information_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? nameController, birthYearController;
  String userName = "Chưa xác định" ;
  String ageText = "Chưa xác định" ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    birthYearController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController!.dispose();
    birthYearController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin người dùng'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // name widget
              textInputWidget(
                  labelText: "Họ và Tên",
                  hintText: "Nhập họ và tên vào đây",
                  controller: nameController),
              // birth year widget
              textInputWidget(
                  labelText: "Năm sinh",
                  hintText: "Nhập năm sinh",
                  controller: birthYearController),
              // button confirm
              ElevatedButton(
                  onPressed: (){
                    // hàm
                    setState(() {
                      userName = nameController!.text;
                      ageText = (DateTime.now().year - int.parse(birthYearController!.text)).toString();
                    });
                  },
                  child: Text('Xác nhận')),
              // information card
              informationCard(
                  nameContent: userName,
                  ageContent: ageText),
              // text button
              TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context) =>
                        InformationScreen(userName: userName, ageText: ageText));
                    Navigator.push(context, route);

                  },
                  child: Text("Chuyển trang")),
            ],
          ),
        ),
      )
    );
  }


 Widget textInputWidget({ required String labelText, required String  hintText, required controller}){
    return Container(
      padding: const EdgeInsets.only(top:10.0, bottom: 5.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      )
    );
  }

}
