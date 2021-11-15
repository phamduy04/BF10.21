import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TitleWidget extends StatelessWidget {
  final String title;
  final String address;
  final String rate;
  const TitleWidget({Key? key, required this.title, required this.address, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Text(address, style: TextStyle(color: Colors.black45))
                  ],
                ),
              ),),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.red),
                    Text(rate)
                  ],
                ),
              ),),
        ],
      ),
    );
  }
}
