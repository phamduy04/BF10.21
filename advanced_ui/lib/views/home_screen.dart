import 'package:advanced_ui/resources/widgets/description_widget.dart';
import 'package:advanced_ui/resources/widgets/icon_text_button.dart';
import 'package:advanced_ui/resources/widgets/image_cover_widget.dart';
import 'package:advanced_ui/resources/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            //1. image cover
            ImageCoverWidget(assetLink: "assets/images/lake.jpeg"),
            //2 title
            TitleWidget(
                title: "Oeschinen Lake Campround",
                address: "Kandersteg, Switzerland",
                rate: "41"),
            //3. button
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: IconTextButton(
                        iconData: Icons.call,
                        text: 'call',
                        onPressed: (){
                          print("Calling");
                        },
                      )),
                  Expanded(
                      flex: 1,
                      child: IconTextButton(
                        iconData: Icons.navigation,
                        text: 'route',
                        onPressed: (){
                          print("Routing");
                        },
                      )),
                  Expanded(
                      flex: 1,
                      child: IconTextButton(
                        iconData: Icons.share,
                        text: 'share',
                        onPressed: (){
                          print("Sharing");
                        },
                      )),
                ],
              ),
            ),
            //4. description
            DescriptionWidget(
                text: "Kandersteg, in the Bernese Highlands, is a dramatic resort village, facing the amazing Bluemlisalp Massif. This wonderful mountain village in the heart of Swiss Alps is a destination worth visiting throughout the calendar year. No doubt, its picture-perfect mountains and wooden chalets seem to cast a spell on you."
                    " But, it is considered a true paradise for skiers and hikers from all over the world."),
          ],
        ),
      ),
    );
  }
}
