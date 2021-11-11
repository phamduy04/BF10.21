import 'package:flutter/material.dart';
class TextInputWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const TextInputWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
