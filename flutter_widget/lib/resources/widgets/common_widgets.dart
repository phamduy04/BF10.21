import 'package:flutter/material.dart';
Widget informationCard({required String nameContent, required String ageContent}){
  return Container(
    child: Card(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const Text('Thông tin', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            textWidget(label: "Họ và Tên: ", content: nameContent),
            const SizedBox(height: 10,),
            textWidget(label: "Tuổi: ", content: ageContent),
          ],
        ),
      ),

    ),
  );


}

Widget textWidget({ required String label, required String content}){
  return Container(
    child: Row(
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold),),
        Text(content)
      ],
    ),
  );
}