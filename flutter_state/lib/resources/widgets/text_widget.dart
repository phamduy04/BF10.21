import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  final String label;
  final String content;
  const TextWidget({Key? key, required this.label, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold),),
          Text(content)
        ],
      ),
    );
  }
}
