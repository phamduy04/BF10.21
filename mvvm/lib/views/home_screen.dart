import 'package:api_lession/resources/strings.dart';
import 'package:api_lession/views/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HOME_SCREEN),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.to(VideoListScreen());
            }, child: Text(LOAD_VIDEO)),
          ],
        ),
      ),
    );
  }
}
