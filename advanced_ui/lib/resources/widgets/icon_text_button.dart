import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class IconTextButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final onPressed;
  const IconTextButton({Key? key, required this.text,required this.iconData,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Icon(iconData, color: Colors.blue,),
            const SizedBox(height: 10,),
            Text(text.toUpperCase(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      onTap: (){
        onPressed;
      },
    );
  }
}
