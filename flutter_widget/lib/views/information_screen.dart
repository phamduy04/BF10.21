import 'package:flutter/material.dart';
import 'package:flutter_widget/resources/widgets/common_widgets.dart';
class InformationScreen extends StatelessWidget {
  final String userName;
  final String ageText;
  const InformationScreen({Key? key,required this.userName, required this.ageText }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin người dùng"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: informationCard(
            nameContent: userName,
            ageContent: ageText),
      ),


    );
  }
}
