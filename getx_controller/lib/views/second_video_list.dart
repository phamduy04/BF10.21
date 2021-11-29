import 'package:api_lession/controllers/video_list_controller.dart';
import 'package:api_lession/models/video_model.dart';
import 'package:api_lession/views/third_video_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondVideoList extends StatelessWidget {
  const SecondVideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách video 2"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.queue_play_next_outlined),
            onPressed: (){
              //Navigator.pop(context);]
              Get.to(()=>ThirdVideoList());
              /*
            var route = MaterialPageRoute(builder: (context) => HomeScreen());
            Navigator.pushAndRemoveUntil(context, route, (route)=> false);

             */
            },
          ),
        ],
      ),
      body: Container(
        child: GetBuilder<VideoListController>(
          init: VideoListController(),
          builder : (videoListController){
            List<VideoModel> videoList = videoListController.videoList;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: videoList.length,
                itemBuilder: (BuildContext context, int index) {
                  VideoModel videoModel = videoList[index];
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
            );
          }
        )
      ),
    );
  }
}
