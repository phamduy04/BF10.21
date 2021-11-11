import 'package:flutter/material.dart';
import 'package:flutter_widget/resources/widgets/text_widget.dart';
class InformationCard extends StatelessWidget {
  final String averageMark;
  final String adjustmentResult;
  const InformationCard({Key? key, required this.averageMark, required this.adjustmentResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const Text('Thông tin', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              TextWidget(label: "Average Mark: ", content: averageMark),
              const SizedBox(height: 10,),
              TextWidget(label: "Adjustment: ", content: adjustmentResult),
            ],
          ),
        ),

      ),
    );
  }
}
