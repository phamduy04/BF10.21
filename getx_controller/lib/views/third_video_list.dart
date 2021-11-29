import 'package:api_lession/controllers/video_list_controller.dart';
import 'package:api_lession/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdVideoList extends StatelessWidget {
  const ThirdVideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   VideoListController videoListController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách video 3"),
        centerTitle: true,
      ),
      body: Container(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: videoListController.videoList.length,
              itemBuilder: (BuildContext context, int index) {
                VideoModel videoModel = videoListController.videoList[index];
                return Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.network(videoModel.url_photo!),
                        Text(videoModel.title!)
                      ],
                    )
                );
              }
          )
      ),
    );
  }
}
